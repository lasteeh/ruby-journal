class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.text :description
      t.date :deadline

      t.timestamps
    end
  end
end
