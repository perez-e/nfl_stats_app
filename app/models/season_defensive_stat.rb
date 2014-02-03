# == Schema Information
#
# Table name: season_defensive_stats
#
#  id         :integer          not null, primary key
#  year       :integer
#  team       :string(255)
#  g          :integer
#  comb       :integer
#  solo       :integer
#  ast        :integer
#  sck        :float
#  sfty       :float
#  pdef       :integer
#  int        :integer
#  td         :integer
#  player_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class SeasonDefensiveStat < ActiveRecord::Base
  belongs_to :player
	@@element_indices = {year:0, team:1, g:2, comb:3, solo:4, ast:5, sck:6, sfty:7,
  						 pdef:8, int:9, td:10}

    def self.defensive_object(player)
    	defense = defensive_stat(player)
    	d_object = []
    	defense.each do |info|
    		d_object << SeasonDefensiveStat.new(info)
    	end
    	return d_object
    end

    private

    def self.defensive_stat(player)
    	defense = []
    	stats = Player.careerstats(player, 'Defensive')
    	stats.each do |stat|
    		d_hash = {}
    		@@element_indices.each do |k, v|
    			d_hash[k] = stat[v].delete(",")
    		end
    		defense << d_hash
    	end
    	return defense
    end
end
