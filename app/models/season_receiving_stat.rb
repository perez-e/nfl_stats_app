# == Schema Information
#
# Table name: season_receiving_stats
#
#  id         :integer          not null, primary key
#  year       :integer
#  team       :string(255)
#  g          :integer
#  rec        :integer
#  yds        :integer
#  avg_rec    :float
#  yds_p_g    :float
#  lng        :string(255)
#  td         :integer
#  twenty     :integer
#  forty      :integer
#  first      :integer
#  fum        :integer
#  player_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class SeasonReceivingStat < ActiveRecord::Base
  belongs_to :player

  	@@element_indices = {year:0, team:1, g:2, rec:3, yds:4, avg_rec:5, yds_p_g:6, lng:7,
  						 td:8, twenty:9, forty:10, first:11, fum:12}

    def self.receiving_object(player)
    	rec = receiving_stat(player)
    	rec_object = []
    	rec.each do |info|
    		rec_object << SeasonReceivingStat.new(info)
    	end
    	return rec_object
    end

    private
    
    def self.receiving_stat(player)
    	receiving = []
    	stats = Player.careerstats(player, 'Receiving')
    	stats.each do |stat|
    		rec_hash = {}
    		@@element_indices.each do |k, v|
    			rec_hash[k] = stat[v]
    		end
    		receiving << rec_hash
    	end
    	return receiving
    end

end
