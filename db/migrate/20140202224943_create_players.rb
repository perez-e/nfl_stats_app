class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :height
      t.string :weight
      t.string :college
      t.string :number
      t.belongs_to :position, index: true

      t.timestamps
    end
  end
end
