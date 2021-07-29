namespace :db do
    desc "Populate local/staging data for testing purpose"
     task populate: :environment do

        character_names = ["Mickey","Dumbo","Arturo","Alice","Tod"]

        #GENRES
        adventure = Genre.create!(
            image_url: "image_url_genre",
            name: "adventure"
        )

        drama = Genre.create!(
            image_url: "image_url_genre",
            name: "drama"
        )

        fantasy = Genre.create!(
            image_url: "image_url_genre",
            name: "fantasy"
        )

        action = Genre.create!(
            image_url: "image_url_genre",
            name: "action"
        )

        #MOVIES
        fantasia = Movie.create!(
            genre: fantasy,
            image_url: "image_url_movie",
            title: "Fantasia",
            date_of_creation: "1940/11/10",
            rating: 4
        )

        dumbo = Movie.create!(
            genre: drama,
            image_url: "image_url_movie",
            title: "Dumbo",
            date_of_creation: "1940/11/12",
            rating: 5
        )

        foxAndHound = Movie.create!(
            genre: drama,
            image_url: "image_url_movie",
            title: "The Fox and the Hound",
            date_of_creation: "1940/11/13",
            rating: 4
        )

        aliceWonderland = Movie.create!(
            genre: adventure,
            image_url: "image_url_movie",
            title: "Alice in Wonderland",
            date_of_creation: "1940/11/14",
            rating: 5
        )

        swordInStone = Movie.create!(
            genre: action,
            image_url: "image_url_movie",
            title: "The Sword In The Stone",
            date_of_creation: "1963/11/15",
            rating: 4            
        )

        def get_movie_for(name)
            case name
            when "Arturo"  
                Movie.find_by(title: "The Sword In The Stone")
            when "Mickey"
                Movie.find_by(title: "Fantasia")
            when "Dumbo" 
                Movie.find_by(title: "Dumbo")
            when "Alice"
                Movie.find_by(title: "Alice in Wonderland")
            when "Tod" 
                Movie.find_by(title: "The Fox and the Hound")
            end
        end

        def get_age_for(name)
            case name
            when "Arturo"
                 "10"
            when "Mickey"
                 "9"
            when "Dumbo"
                 "11"  
            when "Alice"
                 "11"  
            when "Tod"
                 "6" 
            end
        end

        def get_weight_for(name)
            case name
            when "Arturo"
                "12.5"
            when "Mickey"
                "6.5"
            when "Dumbo"
                "11.5"  
            when "Alice"
                "45.5"  
            when "Tod"
                "5.5" 
            end
        end


    # Characters

    character_names.count.times do |i|
    name = character_names[i]
    movie = get_movie_for(name)
    age = get_age_for(name)
    weight = get_weight_for(name)

        
      Character.create!(
       movie: movie,
       image_url: "image_url_character",
       name: name,
       age: age,
       weight: weight,
       history: "History"
      )
      end
   end
end
   