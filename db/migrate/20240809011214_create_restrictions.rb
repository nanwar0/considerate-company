class CreateRestrictions < ActiveRecord::Migration[7.1]
  def change
    create_table :restrictions do |t|
      t.integer :friend_id
      t.integer :diet_id

      t.timestamps
    end
  end
end
