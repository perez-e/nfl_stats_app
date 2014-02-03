class CreateSeasonDefensiveStats < ActiveRecord::Migration
  def change
    create_table :season_defensive_stats do |t|
      t.integer :year
      t.string :team
      t.integer :g
      t.integer :comb
      t.integer :solo
      t.integer :ast
      t.float :sck
      t.float :sfty
      t.integer :pdef
      t.integer :int
      t.integer :td
      t.belongs_to :player, index: true

      t.timestamps
    end
  end
end
