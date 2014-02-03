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
end
