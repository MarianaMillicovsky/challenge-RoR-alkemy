require 'rails_helper'

  RSpec.describe 'API::V1::CharactersController', type: :request do   

    describe 'GET /api/v1/characters' do 
      it 'returns all characters' do

        get api_v1_characters_path
       #get '/api/v1/characters' 

        expect(response).to have_http_status(:ok)
       # expect(JSON.parse(response.body).size).to eq(2)
      end
    end
      
    describe 'GET /api/v1/characters/:id' do   
      context 'when character with given id exists' do
        it 'returns the character with its attributes' do 
          character = create(:character)  #con create, se me invoca y almacena no solo en memoria (como con build, que es asi mas rapido) y se genera asi el id que necesito dar de parametro
          get api_v1_character_path(id: character.id)
          expect(response).to have_http_status(:ok)
          #expect(response).to respond_with_content_type(:json)
        end
      end

      context 'when character with given id does not exist' do
        it 'returns 404 status' do 
          get api_v1_character_path(id: "3")
          expect(response).to have_http_status(:not_found)
        end
      end
    end
           
    describe 'POST /api/v1/characters/' do  
      context 'with valid params' do    #  consultar como usar el context, y para validar y no necesitar ingresar todos los parametros abajo
        it 'create a new character' do 
          movie = create(:movie)
          expect {
           post api_v1_characters_path, params: { movie_id: movie.id, movie: { title: movie.title, rating: movie.rating, image_url: movie.image_url, date_of_creation: movie.date_of_creation},
                                                  name: "Donald", age: "2", weight: "111.2", image_url: "image_url", history: "history" }
          }.to change { Character.count }.from(0).to(1)
          expect(response).to have_http_status(:created)
          #expect(response).to respond_with_content_type(:json)
        end
      end
 
      context 'with invalid params' do
        it 'does not create a new character' do 
          movie = create(:movie)
          post api_v1_characters_path, params: { movie_id: movie.id, movie: { title: "Donald", rating: "5", image_url: "http/donaldTheDuck.com", date_of_creation: "2020/11/11"} }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe 'PUT /api/v1/characters/:id' do  
      it 'updates a character' do 
        character = create(:character)
        put api_v1_character_path(id: character.id)
        expect(response).to have_http_status(:ok)
      end      
    end

    describe 'DELETE /api/v1/characters/:id' do  
      context 'when resource is found' do  
        it 'deletes a character' do 
          character = create(:character)
          expect {
          delete api_v1_character_path(id: character.id)
          }.to change { Character.count }.from(1).to(0)
          expect(response).to have_http_status(:ok)
        end
      end
      context 'when resource is not found' do  
        it 'responds with 422 status' do 
          #character = create(:character)
          #character === nil
          delete api_v1_character_path(id: "0")
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end 
    end

end


  #title: "Donald the duck", rating: "5", image_url: "http/cuteDucks.com", date_of_creation: "2020/11/11"
#, movie: { title: "Donald", rating: "5", image_url: "http/cuteDucks.com", date_of_creation: "2020/11/11"}


#context 'when params[:filter_by] == first_name' do
#  it 'filters results by first_name'
#end
