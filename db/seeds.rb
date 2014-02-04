positions = ["QB", "RB", "FB","OT", "OG", "OC", "TE", "WR", "DE", "DT", "LB", "OLB", "ILB", "CB", "SS", "FS", "DB", "K", "P", "LS"]

positions.each do |position|
	Position.create(name: position)
end


info = Player.player_info('Michael Vick')
p = Player.create(info)

p.season_passing_stats = SeasonPassingStat.passing_object(p.name)
p.season_rushing_stats = SeasonRushingStat.rushing_object(p.name)
p.season_receiving_stats = SeasonReceivingStat.receiving_object(p.name)
p.season_defensive_stats = SeasonDefensiveStat.defensive_object(p.name)