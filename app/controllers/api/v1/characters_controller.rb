module Api 
    module V1 
      class CharactersController < ApiController
        def index
            render json: characters, each_serializer: CharacterSerializer,  status: :ok
        end
    
        private
   
        def characters
            @characters ||= Character.all 
        end
   
        def character_params
         params.require(:character).permit( :image_url, :name, :age, :weight, :history, :movie_id)
        end
   
      end
   
    end
end