FactoryBot.define do                      
    factory :character do 
        name { 'Mickey' }
        age { 12 }
        weight {'111.2'}
        history { "its history" }
        image_url { "image_url" }
        movie
    end
end

#  character = FactoryBot.create(:character) 
#  character.name == "Mickey"

#ver como usar esto en character_spec.rb
        #FactoryBot.create(:character, name: 'Mickey', age: '3', history: 'its history', weight: '122.2')
        #FactoryBot.create(:character, name: 'Mickey', age: '3', history: 'its history', weight: '122.4', movie: 'Dumbo' )
        #FactoryBot.create(:character, name: 'Mickey', age: '3', history: 'its history' )
        # user = User.create(first_name: 'aa', last_name: 'Roe')
        # user = build(:user, first_name: 'aa', last_name: 'Roe')
        # expect(user.full_name)to eq 'aa Roe'

        #character = build(:character, name: 'aa', age: '3', weight: '122.3')