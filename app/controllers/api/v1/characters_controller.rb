module Api 
    module V1 
      class CharactersController < ApiController

        def index
          render json: characters, each_serializer: CharacterSerializer,  status: :ok
        end

        def show
          character 
          render json: character, serializer: ShowCharacterSerializer::CharacterSerializer,  status: :ok 
        end

        def update
          if character.update(character_params)
            render json: character, serializer: ShowCharacterSerializer::CharacterSerializer,  status: :ok  
          else 
            render json: character.errors, status: :unprocessable_entity
          end
        end
  
        def create 
          create_character = Character.new(character_params) 
          create_character.movie = movie_selection_id
          if create_character.save    
          render json: create_character, serializer: CreateCharacterSerializer::CharacterSerializer, status: :created  
         else  
           render json:  create_character.errors , status: :unprocessable_entity
          end
        end
  
        def destroy 
          @character = Character.find_by("id": params[:id])  #el find_by() returns nill si no hay
         
          if  @character.nil?    
            render json: { error: "cannot destroy, it does not exist" }, status: :unprocessable_entity
          else  
            character    #ahora si puedo usar find()
            if character.destroy 
            render json: { message: "character destroyed"}, status: :ok
            end
          end
        end
    
        private
   
        def characters
          @characters ||= fetch_characters 
        end
    
        def fetch_characters 
          chrts = Character.all
          chrts = chrts.for_movie(movie) if movie
          chrts = chrts.for_name(name) if name 
          chrts = chrts.for_age(age) if age 
          chrts = chrts.for_weight(weight) if weight  
          chrts
        end
    
        def name 
          params[:name]
        end 
    
        def age 
          params[:age]
        end 
    
        def weight 
          params[:weight]
        end
    
        def movie 
          params[:movie]
        end 
   
        def character_params
         params.permit( :image_url, :name, :age, :weight, :history, :movie_id)  # le saque el require(:character).
        end

        def character 
          @character ||= Character.find(params[:id])
        end

        def movie_selection_id
          @movie = Movie.find(params[:movie_id])
        end
   
      end
   
    end
end