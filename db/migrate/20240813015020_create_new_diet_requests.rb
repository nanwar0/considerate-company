class CreateNewDietRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :new_diet_requests do |t|
      t.string :name

      t.timestamps
    end
  end
end
