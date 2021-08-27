class Movie < ApplicationRecord
    #Associations
    belongs_to :genre, optional: true
    has_many :characters

    #Validations
    validates :rating, presence: true, numericality: { greater_than_or_equal_to: 1,less_than_or_equal_to:5 }
    validates :title, presence: true
    validates :date_of_creation, presence: true
    
    #Scopes
    scope :for_title, -> (title) { where title: title } 
    scope :for_genre, -> (genre) { joins(:genre).where(genre: {id: genre}) } 
    scope :for_date_of_creation, -> (order) { order(date_of_creation: order) }  
     
end
