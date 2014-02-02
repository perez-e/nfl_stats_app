module PlayersHelper
	def find_current_player_url(player)
		player = player.split.join("+")
		url = "http://www.nfl.com/players/search?category=name&filter=#{player}&playerType=current"
		search_page = Nokogiri::HTML(Typhoeus.get(url).body)
		server = "http://www.nfl.com"
		unless search_page.xpath("//table[@id='result']/tbody/tr/td[3]/a").empty?
			server<<search_page.xpath("//table[@id='result']/tbody/tr/td[3]/a").first.attributes['href'].value
			server.slice!("/profile")
			server
		else
			nil
		end
	end

	def player_info(player)
		info = {}
		player_url = find_current_player_url(player) + "/profile"
		page = Nokogiri::HTML(Typhoeus.get(player_url).body)
		info[:img_url] = player_image(page)
		info[:name] = player_name(page)
		info[:college] = player_college(page)
		info[:height] = player_height(page)
		info[:weight] = player_weight(page)
		return info
	end

	def player_name(noko)
		name = noko.xpath("//div[@class='player-info']//span[@class='player-name']")
		name[0].text.chop.chop
	end

	def player_college(noko)
		college = noko.xpath("//div[@class='player-info']/p[5]")
		college.text.split[1]
	end

	def player_image(noko)
		photo = noko.xpath("//div[@class='player-photo']/img")
		photo[0]['src']
	end

	def player_weight(noko)
		weight = noko.xpath("//div[@class='player-info']/p[3]").text.delete("\n\r\t").split
		weight[4]
	end

	def player_height(noko)
		height = noko.xpath("//div[@class='player-info']/p[3]").text.delete("\n\r\t").split
		height[1]
	end

end
