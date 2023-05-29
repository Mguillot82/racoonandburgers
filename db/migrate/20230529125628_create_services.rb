class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.string :title
      t.text :description
      t.string :item
      t.float :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
