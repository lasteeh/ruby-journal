class Category < ApplicationRecord
    attribute :favorite, :boolean, default: false

    before_validation :name_downcase

    belongs_to :user
    
    has_many :task_categories
    has_many :tasks, through: :task_categories

    validates :name, presence: true, uniqueness: true

    private

    def name_downcase
        self.name = name.downcase if name.present?
    end
end
