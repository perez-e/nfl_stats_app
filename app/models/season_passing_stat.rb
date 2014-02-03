# == Schema Information
#
# Table name: season_passing_stats
#
#  id         :integer          not null, primary key
#  year       :integer
#  g          :integer
#  att        :integer
#  comp       :integer
#  comp_perc  :float
#  att_p_g    :float
#  yds        :integer
#  avg_pass   :float
#  yds_p_g    :float
#  td         :integer
#  int        :integer
#  lng        :string(255)
#  twenty     :integer
#  forty      :integer
#  sck        :integer
#  rating     :float
#  created_at :datetime
#  updated_at :datetime
#  player_id  :integer
#  team       :string(255)
#

class SeasonPassingStat < ActiveRecord::Base
	belongs_to :player
	
	@@element_indices = {year:0, team:1, g:2, att:3, comp:4, comp_perc:5, att_p_g:6, yds:7, avg_pass:8, yds_p_g:9, td: 10,
                   int:12, lng:14, twenty:15, forty:16, sck:17, rating:19 }

    def self.passing_object(player)
    	pass = passing_stat(player)
    	pass_object = []
    	pass.each do |info|
    		pass_object << SeasonPassingStat.new(info)
    	end
    	return pass_object
    end
      
    private

    def self.passing_stat(player)
    	passing = []
    	stats = Player.careerstats(player, 'Passing')
    	stats.each do |stat|
    		pass_hash = {}
    		@@element_indices.each do |k, v|
    			pass_hash[k] = stat[v]
    		end
    		passing << pass_hash
    	end
    	return passing
    end
end
