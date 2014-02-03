class AddPlayerToSeasonRushingStat < ActiveRecord::Migration
  def change
    add_reference :season_rushing_stats, :player, index: true
  end
end
