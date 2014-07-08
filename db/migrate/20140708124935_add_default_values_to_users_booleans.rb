class AddDefaultValuesToUsersBooleans < ActiveRecord::Migration
  def change
    change_column :users, :approved, :boolean, :default => false
    change_column :users, :admin, :boolean, :default => false
  end
end
