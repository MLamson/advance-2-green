# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

# Setup SendGrid Email 

ActionMailer::Base.smtp_settings = {
  :user_name => 'app51794330@heroku.com',
  :password => '5n2tvkmj4643',
  :domain => 'advance-2-green.herokuapp.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}


