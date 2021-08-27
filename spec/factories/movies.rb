FactoryBot.define do                      
    factory :movie do 
        title { "Mickey" }
        image_url { "aaa" }
        date_of_creation { "11/11/2002" }
        rating { 2 }
        genre
    end
end