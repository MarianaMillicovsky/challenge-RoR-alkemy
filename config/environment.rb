# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
    :user_name => 'API RoR Disney', # This is the string literal 'apikey', NOT the ID of your API key
    :password => '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', # This is the secret sendgrid API key which was issued during API key creation
    :domain => 'disneyexplorer.com',
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
  }
  