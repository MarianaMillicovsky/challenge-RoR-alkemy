class Character < ApplicationRecord
    #Associations
    belongs_to :movie, optional: false
   
    #Validations
    validates :age, presence: true, numericality: {only_integer: true}
    validates :weight, numericality: { greater_than_or_equal_to: 0 }, presence: true
    validates :history,
              :name, 
              presence: true

    #Scopes
    scope :for_name, -> (name) { where name: name } 
    scope :for_age, -> (age) { where age: age } 
    scope :for_weight, -> (weight) { where weight: weight }  
    scope :for_movie, -> (movie) { joins(:movie).where(movie: {id: movie}) }          

end
