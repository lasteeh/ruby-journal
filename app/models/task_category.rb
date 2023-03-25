class TaskCategory < ActiveRecord::Base
  belongs_to :task, class_name: 'Task', foreign_key: 'task_id'
  belongs_to :category, class_name: 'Category', foreign_key: 'category_id'
  end