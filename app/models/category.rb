class Category < ApplicationRecord
    before_validation :name_downcase
    
    has_many :task_categories
    has_many :tasks, through: :task_categories

    validates :name, presence: true, uniqueness: true

    private

    def name_downcase
        self.name = name.downcase if name.present?
    end
end
