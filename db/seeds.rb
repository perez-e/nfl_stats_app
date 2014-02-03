positions = ["QB", "RB", "FB","OT", "OG", "OC", "TE", "WR", "DE", "DT", "LB", "OLB", "ILB", "CB", "SS", "FS", "DB", "K", "P", "LS"]

positions.each do |position|
	Position.create(name: position)
end