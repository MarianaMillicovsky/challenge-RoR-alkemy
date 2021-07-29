class Character < ApplicationRecord
    #Associations
    belongs_to :movie, optional: false
   
    #Validations
    validates :age, presence: true, numericality: {only_integer: true}
    validates :weight, numericality: { greater_than_or_equal_to: 0 }, presence: true
    validates :history,
              :name, 
              presence: true

end
