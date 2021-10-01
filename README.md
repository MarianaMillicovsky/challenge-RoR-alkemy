aniadir gem 'rspec-rails'                hacer a users-ong-news-contact-authentication
  gem 'factory_bot_rails' a group: development, test en el Gemfile.
  
  -bundle
  -rspec, ver que este todo bien.
  
  -rails generate rspec:install
  
      create  .rspec
      create  spec
      create  spec/spec_helper.rb
      create  spec/rails_helper.rb
      
      
      
      En rails_helper:   descomentas ->>  Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }
      crear carpeta y archivo -> /spec/support/factory_bot.rb , y dentro poner:
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

este anterior es la configuracion para poder usar los metodos del FactoryBoy junto con rspec., por ej el create.(:user)

 DOCUMENTACION CON SWAGGER
 
 -agregar gema
 gem 'rswag'
 -bundle 
 
 -rails g rswag:install
 
 Running via Spring preloader in process 9048
    generate  rswag:specs:install
       rails  generate rswag:specs:install
Running via Spring preloader in process 9060
      create  spec/swagger_helper.rb
    generate  rswag:api:install
       rails  generate rswag:api:install
Running via Spring preloader in process 9071
      create  config/initializers/rswag_api.rb
       route  mount Rswag::Api::Engine => '/api-docs'
    generate  rswag:ui:install
       rails  generate rswag:ui:install
Running via Spring preloader in process 9101
      create  config/initializers/rswag-ui.rb
       route  mount Rswag::Ui::Engine => '/api-docs'
       

-Create an integration spec to describe and test your API

-Generate the Swagger JSON file(s)
-rake rswag:specs:swaggerize

-Spin up your app and check out the awesome, auto-generated docs at
-http://localhost:3000/api-docs
