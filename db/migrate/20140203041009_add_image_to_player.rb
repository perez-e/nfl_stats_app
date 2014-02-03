class AddImageToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :img_url, :string
  end
end
