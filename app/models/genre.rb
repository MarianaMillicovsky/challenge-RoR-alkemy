class Genre < ApplicationRecord
   #Associations
   has_many :movies

   #Validations
   validates :name, presence: true 
              
end
