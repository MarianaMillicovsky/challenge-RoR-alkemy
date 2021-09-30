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

