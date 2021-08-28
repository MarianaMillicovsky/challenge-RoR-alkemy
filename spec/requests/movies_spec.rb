require 'rails_helper'

  RSpec.describe 'API::V1::MoviesController', type: :request do   

    describe 'GET /api/v1/movies' do 
      it 'returns all movies' do

        get api_v1_movies_path

        expect(response).to have_http_status(:ok)
      end
    end
      
    describe 'GET /api/v1/movies/:id' do   
      context 'when movie with given id exists' do
        it 'returns the movie with its attributes' do 
          movie = create(:movie) 
          get api_v1_movie_path(id: movie.id)
          expect(response).to have_http_status(:ok)
        end
      end

      context 'when movie with given id does not exist' do
        it 'returns 404 status' do 
          get api_v1_movie_path(id: "3")
          expect(response).to have_http_status(:not_found)
        end
      end
    end
           
    describe 'POST /api/v1/movies/' do  
      context 'with valid params' do  
        it 'create a new movie' do 
          genre = FactoryBot.create(:genre)
         # genre.id == "1"
          expect {
           post api_v1_movies_path, params: { genre_id: genre.id, #genre: { name: genre.name, image_url: genre.image_url },
                                              title: "Mickey", rating: "2", image_url: "image_url", date_of_creation: "22/03/2020" }
          }.to change { Movie.count }.from(0).to(1)
          expect(response).to have_http_status(:created)
        end
      end
 
      context 'with invalid params' do
        it 'does not create a new movie' do 
         # genre = create(:genre)
          post api_v1_movies_path, params: { title: "Mickey", rating: "2" }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe 'PUT /api/v1/movies/:id' do  
      it 'updates a movie' do 
        movie = create(:movie)
        put api_v1_movie_path(id: movie.id)
        expect(response).to have_http_status(:ok)
      end      
    end

    describe 'DELETE /api/v1/movies/:id' do  
      context 'when resource is found' do  
        it 'deletes a movie' do 
          movie = create(:movie)
          expect {
          delete api_v1_movie_path(id: movie.id)
          }.to change { Movie.count }.from(1).to(0)
          expect(response).to have_http_status(:ok)
        end
      end
      context 'when resource is not found' do  
        it 'responds with 422' do 
          delete api_v1_movie_path(id: "0")
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end 
    end

end
