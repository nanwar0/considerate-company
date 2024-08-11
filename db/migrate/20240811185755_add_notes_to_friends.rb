class AddNotesToFriends < ActiveRecord::Migration[7.1]
  def change
    add_column :friends, :notes, :text
  end
end
