# == Schema Information
#
# Table name: season_rushing_stats
#
#  id         :integer          not null, primary key
#  year       :integer
#  team       :string(255)
#  g          :integer
#  att        :integer
#  att_p_g    :float
#  yds        :integer
#  avg_rush   :float
#  yds_p_g    :float
#  td         :integer
#  lng        :string(255)
#  first      :integer
#  twenty     :integer
#  forty      :integer
#  fum        :integer
#  created_at :datetime
#  updated_at :datetime
#  player_id  :integer
#

class SeasonRushingStat < ActiveRecord::Base
	belongs_to :player

  	@@element_indices = {year:0, team:1, g:2, att:3, att_p_g:4, yds:5, avg_rush:6, yds_p_g:7, td:8,
  						 lng:9, first:10, twenty:12, forty:13, fum:12}

    def self.rushing_object(player)
    	rush = rushing_stat(player)
    	rush_object = []
    	rush.each do |info|
    		rush_object << SeasonRushingStat.new(info)
    	end
    	return rush_object
    end

    private

    def self.rushing_stat(player)
    	rushing = []
    	stats = Player.careerstats(player, 'Rushing')
    	stats.each do |stat|
    		rush_hash = {}
    		@@element_indices.each do |k, v|
    			rush_hash[k] = stat[v].delete(",")
    		end
    		rushing << rush_hash
    	end
    	return rushing
    end
end
