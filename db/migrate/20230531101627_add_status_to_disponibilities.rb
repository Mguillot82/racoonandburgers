class AddStatusToDisponibilities < ActiveRecord::Migration[7.0]
  def change
    add_column :disponibilities, :status, :string
  end
end
