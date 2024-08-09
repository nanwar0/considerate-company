class CreateFriends < ActiveRecord::Migration[7.1]
  def change
    create_table :friends do |t|
      t.string :name
      t.text :address
      t.date :birthday
      t.integer :user_id

      t.timestamps
    end
  end
end
