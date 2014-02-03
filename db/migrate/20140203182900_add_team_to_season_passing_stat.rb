class AddTeamToSeasonPassingStat < ActiveRecord::Migration
  def change
    add_column :season_passing_stats, :team, :string
  end
end
