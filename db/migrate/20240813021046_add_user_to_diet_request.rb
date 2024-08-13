class AddUserToDietRequest < ActiveRecord::Migration[7.1]
  def change
    add_column :new_diet_requests, :user_id, :integer
  end
end
