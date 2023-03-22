class CreateTaskCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :task_categories do |t|
      t.integer :task_id
      t.integer :category_id

      t.timestamps
    end
    add_index :task_categories, :task_id
    add_index :task_categories, :category_id
  end
end
