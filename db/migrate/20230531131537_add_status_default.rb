class AddStatusDefault < ActiveRecord::Migration[7.0]
  def change
    change_column :disponibilities, :status, :string, default: 'available'
  end
end
