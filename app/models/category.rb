class Category < ApplicationRecord
    before_validation :name_downcase

    validates :name, presence: true, uniqueness: true

    private

    def name_downcase
        self.name = name.downcase.strip if name.present?
    end
end
