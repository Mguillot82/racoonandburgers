class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.integer :photo_id
      t.string :first_name
      t.string :last_name
      t.boolean :racoon
      t.float :balance
      t.string :address
      t.string :city

      t.timestamps
    end
  end
end
