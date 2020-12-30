class RenameCategoriesColumnToCategoryId < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :categories, :category_id

  end
end
