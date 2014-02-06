# == Schema Information
#
# Table name: user_players
#
#  id         :integer          not null, primary key
#  player_id  :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class UserPlayer < ActiveRecord::Base
  belongs_to :player
  belongs_to :user
end
