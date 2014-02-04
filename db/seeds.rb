positions = ["QB", "RB", "FB","OT", "OG", "OC", "TE", "WR", "DE", "DT", "LB", "OLB", "MLB", "ILB", "CB", "SS", "FS", "DB", "K", "P", "LS"]

positions.each do |position|
	Position.create(name: position)
end

names = ['Michael Vick', 'Tom Brady', 'Peyton Manning', 'Aaron Rodgers', 'Adrian Peterson', 
		 'Lesean McCoy', 'Patrick Peterson', 'Richard Sherman', 'Watt', 'Hardy', 'Eric Berry',
		 'Calvin Johnson', 'Josh Gordon', 'Rob Gronkowski', 'Jimmy Graham', 'Matt Forte', 
		 'Suh', 'Ngata', 'Luke Kuechly', 'Suggs', 'Robert Quinn', 'A.J. Green']

names.each do |name|
	info = Player.player_info(name)
	p = Player.create(info)

	p.season_passing_stats = SeasonPassingStat.passing_object(p.name)
	p.season_rushing_stats = SeasonRushingStat.rushing_object(p.name)
	p.season_receiving_stats = SeasonReceivingStat.receiving_object(p.name)
	p.season_defensive_stats = SeasonDefensiveStat.defensive_object(p.name)
end