// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$(document).on('ready page:load', function(){

  var nfl_id = $('#player-name').data().nfl_id

  $.ajax({type: "get", url: "/players/"+ nfl_id + ".json"}).done(function(response){
    
    nv.addGraph(function() {
      var chart = nv.models.multiBarChart();

      chart.xAxis
          .axisLabel("Year");

      chart.yAxis
          .axisLabel("Y-axis Label")
          .tickFormat(d3.format("d"))
          ;

      // Receiving Graphs
      d3.select("svg.receiving-yds")
          .datum(FootballStats(response.season_receiving_stats, 'yds', 'Receiving Yards'))
          .transition().duration(500).call(chart);

      d3.select("svg.receiving-td")
        .datum(FootballStats(response.season_receiving_stats, 'td', 'Receiving TD'))
        .transition().duration(500).call(chart);

      d3.select("svg.receiving-yds-g")
        .datum(FootballStats(response.season_receiving_stats, 'yds_p_g', 'Receiving Yds Per Game'))
        .transition().duration(500).call(chart);

      d3.select("svg.receiving-avg")
        .datum(FootballStats(response.season_receiving_stats, 'avg_rec', 'Avg Yds Per Reception'))
        .transition().duration(500).call(chart);


      // Rushing Graphs
      d3.select("svg.rushing-yds")
          .datum(FootballStats(response.season_rushing_stats, 'yds', 'Rushing Yards'))
          .transition().duration(500).call(chart);

      d3.select("svg.rushing-td")
        .datum(FootballStats(response.season_rushing_stats, 'td', 'Rushing TD'))
        .transition().duration(500).call(chart);

      d3.select("svg.rushing-yds-g")
        .datum(FootballStats(response.season_rushing_stats, 'yds_p_g', 'Rushing Yds Per Game'))
        .transition().duration(500).call(chart);

      d3.select("svg.rushing-avg")
        .datum(FootballStats(response.season_rushing_stats, 'avg_rush', 'Avg Yds Per Rush'))
        .transition().duration(500).call(chart);


      // Passing Graphs
      d3.select("svg.passing-yds")
        .datum(FootballStats(response.season_passing_stats, 'yds', 'Passing Yards'))
        .transition().duration(500).call(chart);

      d3.select("svg.passing-td")
        .datum(FootballStats(response.season_passing_stats, 'td', 'Passing TD'))
        .transition().duration(500).call(chart);

      d3.select("svg.passing-yds-g")
        .datum(FootballStats(response.season_passing_stats, 'yds_p_g', 'Passing Yds Per Game'))
        .transition().duration(500).call(chart);

      d3.select("svg.interception")
        .datum(FootballStats(response.season_passing_stats, 'int', 'Interceptions'))
        .transition().duration(500).call(chart);

      d3.select("svg.rating")
        .datum(FootballStats(response.season_passing_stats, 'rating', 'QB Rating'))
        .transition().duration(500).call(chart);


      // Defense Graphs
      d3.select("svg.tackles")
        .datum(Tackles(response.season_defensive_stats))
        .transition().duration(500).call(chart);

      d3.select("svg.sacks")
        .datum(FootballStats(response.season_defensive_stats, 'sck', 'Sacks'))
        .transition().duration(500).call(chart);

      d3.select("svg.d-int")
        .datum(FootballStats(response.season_defensive_stats, 'int', 'Defensive Interceptions'))
        .transition().duration(500).call(chart);

      nv.utils.windowResize(
              function() {
                  chart.update();
              }
          );

      return chart;
    });

  })


});


function FootballStats(player_data, category, key) {
    var series1 = [];
    for(var i =0; i < player_data.length; i ++) {
        series1.push({
            x: player_data[i].year, y: player_data[i][category]
        });
    }

    return [
        {
            key: key,
            values: series1,
            color: "#0000ff"
        }
    ];
}

function Tackles(player_data) {
    var series1 = [];
    var series2 = [];
    var series3 = [];
    for(var i =0; i < player_data.length; i ++) {
        series1.push({
            x: player_data[i].year, y: player_data[i].solo
        });

        series2.push({
            x: player_data[i].year, y: player_data[i].ast
        });

        series3.push({
            x: player_data[i].year, y: player_data[i].comb
        });
    }

    return [
        {
            key: "Assisted Tackles",
            values: series2,
            color: "#46A2CC"
        },
        {
            key: "Solo Tackles",
            values: series1,
            color: "#0000ff"
        },
        {
            key: "Combined",
            values: series3,
            color: "#B2152B"
        }
    ];
}


