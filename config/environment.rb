# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
MakeSandwich::Application.initialize!

Mail.defaults do
  delivery_method :smtp, {
    :address => 'smtp.sendgrid.net',
    :port => '587',
    :domain => 'heroku.com',
    :user_name => ENV['SENDGRID_USERNAME'],
    :password => ENV['SENDGRID_PASSWORD'],
    :authentication => :login,
    :enable_starttls_auto => true
  }
end