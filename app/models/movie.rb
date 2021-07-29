class Movie < ApplicationRecord
    #Associations
    belongs_to :genre
    has_many :characters

    #Validations
    validates :rating, presence: true, numericality: { greater_than_or_equal_to: 1,less_than_or_equal_to:5 }
    validates :title, presence: true
    validates :date_of_creation, presence: true              
     
end
