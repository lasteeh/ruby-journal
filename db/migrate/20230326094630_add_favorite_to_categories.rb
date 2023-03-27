class AddFavoriteToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :favorite, :boolean, default: false
  end
end
