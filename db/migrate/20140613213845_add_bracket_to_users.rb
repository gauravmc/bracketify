class AddBracketToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bracket, :text
  end
end
