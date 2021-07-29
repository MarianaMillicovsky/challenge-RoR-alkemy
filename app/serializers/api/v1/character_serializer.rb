module Api
    module V1 
        class CharacterSerializer < ApplicationSerializer
            attributes :id,
                       :image_url,
                       :name                     
        end
    end
end 