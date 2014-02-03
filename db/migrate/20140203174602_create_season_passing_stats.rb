class CreateSeasonPassingStats < ActiveRecord::Migration
  def change
    create_table :season_passing_stats do |t|
      t.integer :year
      t.integer :g
      t.integer :att
      t.integer :comp
      t.float :comp_perc
      t.float :att_p_g
      t.integer :yds
      t.float :avg_pass
      t.float :yds_p_g
      t.integer :td
      t.integer :int
      t.string :lng
      t.integer :20
      t.integer :40
      t.integer :sck
      t.float :rating

      t.timestamps
    end
  end
end
