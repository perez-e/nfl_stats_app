# == Schema Information
#
# Table name: players
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  height      :string(255)
#  weight      :string(255)
#  college     :string(255)
#  number      :string(255)
#  position_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#  img_url     :string(255)
#  nfl_id      :integer
#

class Player < ActiveRecord::Base
  belongs_to :position
  has_many :user_players
  has_many :users, through: :user_players
  has_many :season_passing_stats
  has_many :season_receiving_stats
  has_many :season_rushing_stats
  has_many :season_defensive_stats

	def self.player_info(player)
		info = {}
		p = find_current_player_url(player)
		return info if p.nil?
		player_url = p + "/profile"
		page = Nokogiri::HTML(Typhoeus.get(player_url).body)

		info[:nfl_id] = player_url.split("/")[-2]
		info[:img_url] = player_image(page)
		info[:name] = player_name(page)
		info[:college] = player_college(page)
		info[:height] = player_height(page)
		info[:weight] = player_weight(page)
		info[:position_id] = player_position(page).id
		info[:number] = player_number(page)
		return info
	end

	def self.careerstats(player, label)
		info = []
		p = find_current_player_url(player)
		return info if p.nil?
		player_url = p + "/careerstats"
		page = Nokogiri::HTML(Typhoeus.get(player_url).body)

		table = page.xpath("//table[contains(@summary,'#{label}')]/tbody/tr[not(@class)]")
		table.each do |node|
			if !node.text.blank?
				stats = []
				node.xpath("./td").each do |tr|
					stat = tr.text
					stat.delete!("\r\t\n")
					stats << stat
				end
				info << stats
			end
		end
		return info
	end

	private

  	def self.find_current_player_url(player)
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

	def self.player_name(noko)
		name = noko.xpath("//div[@class='player-info']//span[@class='player-name']")
		name[0].text.chop.chop
	end

	def self.player_college(noko)
		college = noko.xpath("//div[@class='player-info']/p[5]")
		college.text.split[1..-1].join(" ")
	end

	def self.player_image(noko)
		photo = noko.xpath("//div[@class='player-photo']/img")
		photo[0]['src']
	end

	def self.player_weight(noko)
		weight = noko.xpath("//div[@class='player-info']/p[3]").text.delete("\n\r\t").split
		weight[4]
	end

	def self.player_height(noko)
		height = noko.xpath("//div[@class='player-info']/p[3]").text.delete("\n\r\t").split
		height[1]
	end

	def self.player_position(noko)
		position = noko.xpath("//div[@class='player-info']//span[@class='player-number']")
		pos = correct_position(position.text.split[1])
		Position.find_by_name(pos)
	end

	def self.correct_position(position)
		case position
		when "G", "T", "C"
			return "O" << position
		when "NT"
			return "DT"
		else
			return position
		end
	end

	def self.player_number(noko)
		number = noko.xpath("//div[@class='player-info']//span[@class='player-number']")
		number.text.split[0]
	end	
	
end
