  module Api
    module V1 
        module ShowCharacterSerializer
            class CharacterSerializer < ApplicationSerializer
              attributes :id,
                         :image_url,
                         :name, 
                         :age, 
                         :weight,
                         :history

              has_one :movie, serializer: MovieSerializer           
            end
        end
    end
end 