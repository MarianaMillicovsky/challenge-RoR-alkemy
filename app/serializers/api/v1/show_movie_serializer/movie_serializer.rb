module Api
    module V1 
        module ShowMovieSerializer
            class MovieSerializer < ApplicationSerializer
              attributes :id,
                         :image_url,
                         :title, 
                         :date_of_creation, 
                         :rating

              has_many :characters, serializer: CharacterSerializer 
              #has_one :genre, serializer: GenreSerializer           
            end
        end
    end
end  