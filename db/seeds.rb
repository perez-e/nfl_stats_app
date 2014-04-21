positions = ["QB", "RB", "FB","OT", "OG", "OC", "TE", "WR", "DE", "DT", "LB", "OLB", "MLB", "ILB", "CB", "SS", "FS", "DB", "SAF","K", "P", "LS"]

positions.each do |position|
	Position.create(name: position)
end

roster_URL = "http://www.nfl.com/teams/buffalobills/roster?team="
nfl_URL="http://www.nfl.com"

nfl_teams = ["BAL", "CIN", "CLE", "PIT", 
							"HOU", "IND", "JAC", "TEN",
							"BUF", "MIA", "NE", "NYJ",
							"DEN", "KC", "OAK", "SD", 
							"CHI", "DET", "GB", "MIN", 
							"ATL", "CAR", "NO", "TB", 
							"DAL", "NYG", "PHI", "WAS", 
							"ARI", "SF", "SEA", "STL"
						]


nfl_teams.each do |team|
	roster_page = Nokogiri::HTML(Typhoeus.get(roster_URL+team).body)
	players = roster_page.xpath("//table[@id='result']/tbody[1]/tr/td/a")
	puts team
	players.each do |player|
		player_URL = nfl_URL + player.attributes['href'].value
		puts player_URL
		p = Player.player_info(player_URL)
		p = Player.create(p)
		p.season_passing_stats = SeasonPassingStat.passing_object(p)
		p.season_rushing_stats = SeasonRushingStat.rushing_object(p)
		p.season_defensive_stats = SeasonDefensiveStat.defensive_object(p)
		p.season_receiving_stats = SeasonReceivingStat.receiving_object(p)
		p.save
	end
end

