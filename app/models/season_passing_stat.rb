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
#

class SeasonPassingStat < ActiveRecord::Base
end
