class AddSortOrderToDiets < ActiveRecord::Migration[7.1]
  def change
    add_column :diets, :sort_column, :integer
  end
end
