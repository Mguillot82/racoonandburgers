class ChangeInTableForInclusionOfRacoon < ActiveRecord::Migration[7.0]
  def change
    add_column :racoons, :balance, :float
    remove_column :users, :balance, :float
    remove_column :users, :photo_id, :integer
    remove_column :users, :racoon, :boolean
    remove_reference :services, :user, foreign_key: true, index: false
    add_reference :services, :racoon, foreign_key: true
    remove_reference :disponibilities, :user, foreign_key: true, index: false
    add_reference :disponibilities, :racoon, foreign_key: true
    remove_reference :reservations, :user, foreign_key: true, index: false
    add_reference :reservations, :racoon, foreign_key: true
  end
end
