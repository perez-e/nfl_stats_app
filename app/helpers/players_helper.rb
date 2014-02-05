module PlayersHelper
	def nav_tab_stat(position)
		case position
		when "QB"
			return '<li class="active"><a href="#passing" data-toggle="tab">Passing</a></li>
  <li><a href="#rushing" data-toggle="tab">Rushing</a></li>'
		when "RB", "FB"
			return '<li class="active"><a href="#rushing" data-toggle="tab">Rushing</a></li>
  <li><a href="#receiving" data-toggle="tab">Receiving</a></li>'
		when "WR", "TE"
			return '<li class="active"><a href="#receiving" data-toggle="tab">Receiving</a></li>
			<li><a href="#rushing" data-toggle="tab">Rushing</a></li>'
		when "ILB", "MLB", "OLB", "DE", "DT", "FS", "SS", "CB", "DB", "LB"
			return '<li class="active"><a href="#defensive" data-toggle="tab">Defensive</a></li>'
		else
			return '<li class="active"><a href="#passing" data-toggle="tab">Passing</a></li>
  <li><a href="#rushing" data-toggle="tab">Rushing</a></li>
  <li><a href="#receiving" data-toggle="tab">Receiving</a></li>
  <li><a href="#defensive" data-toggle="tab">Defensive</a></li>'
		end
	end

	def nav_tab_active(position)
		case position
		when "QB"
			return ['in active', '', '', '' ]
		when "RB", "FB"
			return ['', 'in active', '', '' ]
		when "WR", "TE"
			return ['', '', 'in active', '' ]
		when "ILB", "MLB", "OLB", "DE", "DT", "FS", "SS", "CB", "DB", "LB"
			return ['', '', '', 'in active' ]
		else
			return ['in active', '', '', '' ]
		end
	end

end
