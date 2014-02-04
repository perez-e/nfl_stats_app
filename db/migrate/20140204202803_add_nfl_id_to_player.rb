class AddNflIdToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :nfl_id, :integer
  end
end
