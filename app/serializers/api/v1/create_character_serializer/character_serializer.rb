module Api
    module V1 
        module CreateCharacterSerializer
            class CharacterSerializer < ApplicationSerializer
              attributes :id,
                         :image_url,
                         :name

              has_one :movie, serializer: MovieSerializer           
            end
        end
    end
end