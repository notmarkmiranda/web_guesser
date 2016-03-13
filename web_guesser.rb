require 'sinatra'
require 'sinatra/reloader'
require 'pry'


SECRET_NUMBER = rand(100)

 def check_guess(guess)

   if guess.nil?
     message = ""
     color = "red"
     [message, color]
   elsif guess.to_i > SECRET_NUMBER + 5
     message = "Way too high!"
     color = "blue"
     [message, color]
   elsif guess.to_i > SECRET_NUMBER
     message = "Too high!"
     color = "pink"
     [message, color]
   elsif guess.to_i < SECRET_NUMBER - 5
     message = "Way too low!"
     color = "green"
     [message, color]
   elsif guess.to_i < SECRET_NUMBER
     message = "Too low!"
     color = "orange"
     [message, color]
   else
     message = "THE SECRET NUMBER IS #{SECRET_NUMBER}! YOU GOT IT RIGHT!"
     color = "yellow"
     [message, color]
   end
 
 end



get '/' do
  guess = params["guess"]
  response = check_guess(guess)
  erb:index, :locals => {:number => SECRET_NUMBER, :message => response[0], :color => response[1]}
end
