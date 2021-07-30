module Api
    module V1 
        class MovieSerializer < ApplicationSerializer
            attributes :id,
                       :title,
                       :image_url,
                       :date_of_creation 
        end
    end
end