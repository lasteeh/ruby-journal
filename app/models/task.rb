class Task < ApplicationRecord
    belongs_to :user
    has_many :task_categories, class_name: 'TaskCategory', foreign_key: 'task_id'
    has_many :categories, through: :task_categories

    def self.sort_by_deadline 
       order(deadline: :asc)
    end

end
