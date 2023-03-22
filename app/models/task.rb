class Task < ApplicationRecord
    belongs_to :user
    has_many :task_categories
    has_many :categories, through: :task_categories

    validates :description, presence: true


    def self.sort_by_deadline 
       order(deadline: :asc)
    end

end
