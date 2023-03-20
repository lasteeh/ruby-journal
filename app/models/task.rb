class Task < ApplicationRecord
    validates :description, presence: true


    def self.sort_by_deadline 
       order(deadline: :asc)
    end

end
