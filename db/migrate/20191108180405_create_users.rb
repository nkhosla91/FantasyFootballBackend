class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :username, limit: 30
      t.string :password
      t.timestamps
    end
  end
end
