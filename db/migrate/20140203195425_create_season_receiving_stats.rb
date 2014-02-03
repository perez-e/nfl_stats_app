class CreateSeasonReceivingStats < ActiveRecord::Migration
  def change
    create_table :season_receiving_stats do |t|
      t.integer :year
      t.string :team
      t.integer :g
      t.integer :rec
      t.integer :yds
      t.float :avg_rec
      t.float :avg_rec
      t.float :yds_p_g
      t.string :lng
      t.integer :td
      t.integer :twenty
      t.integer :forty
      t.integer :first
      t.integer :fum
      t.belongs_to :player, index: true

      t.timestamps
    end
  end
end
