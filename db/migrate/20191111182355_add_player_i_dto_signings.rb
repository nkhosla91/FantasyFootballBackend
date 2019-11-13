class AddPlayerIDtoSignings < ActiveRecord::Migration[6.0]
  def change
    add_column :signings, :player_id, :integer
  end
end
