module Api 
    module V1 
      class MoviesController < ApiController
        def index
            movies = Movie.all    
            render json: movies, each_serializer: MovieSerializer,  status: :ok
        end
    
        private

   
        def movie_params
           params.require(:movie).permit(:image_url, :title, :date_of_creation, :rating)
        end

      end
    end
end