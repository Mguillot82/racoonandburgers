class CreateDisponibilities < ActiveRecord::Migration[7.0]
  def change
    create_table :disponibilities do |t|
      t.date :date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
