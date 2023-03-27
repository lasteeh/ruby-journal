class Task < ApplicationRecord
    belongs_to :user
    has_many :task_categories, class_name: 'TaskCategory', foreign_key: 'task_id'
    has_many :categories, through: :task_categories

    validates :description, presence: true
end
