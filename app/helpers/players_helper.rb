module PlayersHelper
	def find_current_player(player)
		binding.pry
		player = player.split.join("+")
		url = "http://www.nfl.com/players/search?category=name&filter=#{player}&playerType=current"
		binding.pry
		search_page = Nokogiri::HTML(open(url))
	end
end
