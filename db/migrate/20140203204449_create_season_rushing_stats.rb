class CreateSeasonRushingStats < ActiveRecord::Migration
  def change
    create_table :season_rushing_stats do |t|
      t.integer :year
      t.string :team
      t.integer :g
      t.integer :att
      t.float :att_p_g
      t.integer :yds
      t.float :avg_rush
      t.float :yds_p_g
      t.integer :td
      t.string :lng
      t.integer :first
      t.integer :twenty
      t.integer :forty
      t.integer :fum

      t.timestamps
    end
  end
end
