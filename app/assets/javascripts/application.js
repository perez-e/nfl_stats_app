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

function ReceivingYds(player) {
    var series1 = [];
    for(var i =0; i < player.length; i ++) {
        series1.push({
            x: player[i].year, y: player[i].yds
        });
    }

    return [
        {
            key: "Receiving Yards",
            values: series1,
            color: "#0000ff"
        }
    ];
}

function ReceivingTD(player) {
    var series1 = [];
    for(var i =0; i < player.length; i ++) {
        series1.push({
            x: player[i].year, y: player[i].td
        });
    }

    return [
        {
            key: "Receiving TD",
            values: series1,
            color: "#0000ff"
        }
    ];
}

function ReceivingYdsPerGame(player) {
    var series1 = [];
    for(var i =0; i < player.length; i ++) {
        series1.push({
            x: player[i].year, y: player[i].yds_p_g
        });
    }

    return [
        {
            key: "Receiving Yards Per Game",
            values: series1,
            color: "#0000ff"
        }
    ];
}

function ReceivingAvg(player) {
    var series1 = [];
    for(var i =0; i < player.length; i ++) {
        series1.push({
            x: player[i].year, y: player[i].avg_rec
        });
    }

    return [
        {
            key: "Avg Yards Per Reception",
            values: series1,
            color: "#0000ff"
        }
    ];
}

nv.addGraph(function() {
    var chart = nv.models.lineChart();

    chart.xAxis
        .axisLabel("Year");

    chart.yAxis
        .axisLabel("Y-axis Label")
        .tickFormat(d3.format("d"))
        ;

    d3.select("svg.receiving-yds")
        .datum(ReceivingYds(gon.player_receiving))
        .transition().duration(500).call(chart);

    nv.utils.windowResize(
            function() {
                chart.update();
            }
        );

    return chart;
});

nv.addGraph(function() {
    var chart = nv.models.lineChart();

    chart.xAxis
        .axisLabel("Year");

    chart.yAxis
        .axisLabel("Y-axis Label")
        .tickFormat(d3.format("d"))
        ;

    d3.select("svg.receiving-td")
        .datum(ReceivingTD(gon.player_receiving))
        .transition().duration(500).call(chart);

    nv.utils.windowResize(
            function() {
                chart.update();
            }
        );

    return chart;
});

nv.addGraph(function() {
    var chart = nv.models.lineChart();

    chart.xAxis
        .axisLabel("Year");

    chart.yAxis
        .axisLabel("Y-axis Label")
        .tickFormat(d3.format("d"))
        ;

    d3.select("svg.receiving-yds-g")
        .datum(ReceivingYdsPerGame(gon.player_receiving))
        .transition().duration(500).call(chart);

    nv.utils.windowResize(
            function() {
                chart.update();
            }
        );

    return chart;
});

nv.addGraph(function() {
    var chart = nv.models.lineChart();

    chart.xAxis
        .axisLabel("Year");

    chart.yAxis
        .axisLabel("Y-axis Label")
        .tickFormat(d3.format("d"))
        ;

    d3.select("svg.receiving-avg")
        .datum(ReceivingAvg(gon.player_receiving))
        .transition().duration(500).call(chart);

    nv.utils.windowResize(
            function() {
                chart.update();
            }
        );

    return chart;
});

function RushingYds(player) {
    var series1 = [];
    for(var i =0; i < player.length; i ++) {
        series1.push({
            x: player[i].year, y: player[i].yds
        });
    }

    return [
        {
            key: "Rushing Yards",
            values: series1,
            color: "#0000ff"
        }
    ];
}

function RushingTD(player) {
    var series1 = [];
    for(var i =0; i < player.length; i ++) {
        series1.push({
            x: player[i].year, y: player[i].td
        });
    }

    return [
        {
            key: "Rushing TD",
            values: series1,
            color: "#0000ff"
        }
    ];
}

function RushingYdsPerGame(player) {
    var series1 = [];
    for(var i =0; i < player.length; i ++) {
        series1.push({
            x: player[i].year, y: player[i].yds_p_g
        });
    }

    return [
        {
            key: "Rushing Yards Per Game",
            values: series1,
            color: "#0000ff"
        }
    ];
}

function RushingAvg(player) {
    var series1 = [];
    for(var i =0; i < player.length; i ++) {
        series1.push({
            x: player[i].year, y: player[i].avg_rush
        });
    }

    return [
        {
            key: "Avg Yards Per Rush",
            values: series1,
            color: "#0000ff"
        }
    ];
}

nv.addGraph(function() {
    var chart = nv.models.lineChart();

    chart.xAxis
        .axisLabel("Year");

    chart.yAxis
        .axisLabel("Y-axis Label")
        .tickFormat(d3.format("d"))
        ;

    d3.select("svg.rushing-yds")
        .datum(RushingYds(gon.player_rushing))
        .transition().duration(500).call(chart);

    nv.utils.windowResize(
            function() {
                chart.update();
            }
        );

    return chart;
});

nv.addGraph(function() {
    var chart = nv.models.lineChart();

    chart.xAxis
        .axisLabel("Year");

    chart.yAxis
        .axisLabel("Y-axis Label")
        .tickFormat(d3.format("d"))
        ;

    d3.select("svg.rushing-td")
        .datum(RushingTD(gon.player_rushing))
        .transition().duration(500).call(chart);

    nv.utils.windowResize(
            function() {
                chart.update();
            }
        );

    return chart;
});

nv.addGraph(function() {
    var chart = nv.models.lineChart();

    chart.xAxis
        .axisLabel("Year");

    chart.yAxis
        .axisLabel("Y-axis Label")
        .tickFormat(d3.format("d"))
        ;

    d3.select("svg.rushing-yds-g")
        .datum(RushingYdsPerGame(gon.player_rushing))
        .transition().duration(500).call(chart);

    nv.utils.windowResize(
            function() {
                chart.update();
            }
        );

    return chart;
});

nv.addGraph(function() {
    var chart = nv.models.lineChart();

    chart.xAxis
        .axisLabel("Year");

    chart.yAxis
        .axisLabel("Y-axis Label")
        .tickFormat(d3.format("d"))
        ;

    d3.select("svg.rushing-avg")
        .datum(RushingAvg(gon.player_rushing))
        .transition().duration(500).call(chart);

    nv.utils.windowResize(
            function() {
                chart.update();
            }
        );

    return chart;
});




