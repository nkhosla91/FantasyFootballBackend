class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :position
      t.string :teamAbbr
      t.integer :seasonPts
      t.integer :seasonProjectedPts
      t.integer :weekPts
      t.integer :weekProjectedPts
    end
  end
end
