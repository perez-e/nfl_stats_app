class CreateUserPlayers < ActiveRecord::Migration
  def change
    create_table :user_players do |t|
      t.belongs_to :player, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
