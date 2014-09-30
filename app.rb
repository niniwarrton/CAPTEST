require 'mail'
require 'sinatra'

options = { :address              => "smtp.gmail.com",
            :port                 => 587,
            :domain               => 'gmail.com',
            :user_name            => 'captesting157',
            :password             => 'cap157soar',
            :authentication       => 'plain',
            :enable_starttls_auto => true  }

Mail.defaults do
  delivery_method :smtp, options
end


get '/' do
  'Hello world!'
end

post '/test_request' do
  message =  "Name: #{params[:name]}\n"
  message += "CAPID: #{params[:capid]}\n"
  message += "Email: #{params[:email]}\n"
  message += "Test: #{params[:test]}\n"
  message += "Message: #{params[:message]}\n"


  mail = Mail.deliver do
    from    'captesting157@gmail.com'
    to      'ngaio.warrington@yahoo.com'
    subject 'This is a test email'
    body    message
  end
end
