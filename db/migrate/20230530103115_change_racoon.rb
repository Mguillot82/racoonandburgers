class ChangeRacoon < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :racoon, :boolean, default: false
  end
end
