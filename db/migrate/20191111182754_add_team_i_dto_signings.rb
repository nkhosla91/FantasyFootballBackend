class AddTeamIDtoSignings < ActiveRecord::Migration[6.0]
  def change
    add_column :signings, :team_id, :integer
  end
end
