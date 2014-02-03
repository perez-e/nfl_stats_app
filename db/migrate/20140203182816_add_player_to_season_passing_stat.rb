class AddPlayerToSeasonPassingStat < ActiveRecord::Migration
  def change
    add_reference :season_passing_stats, :player, index: true
  end
end
