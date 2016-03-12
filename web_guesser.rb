require 'sinatra'
require 'sinatra/reloader'
require 'pry'


SECRET_NUMBER = rand(100)

 def check_guess(guess)

   if guess.nil?
     color = "red"
     message = ""
   elsif guess.to_i > SECRET_NUMBER + 5
     color = "blue"
     message = "Way too high!"
   elsif guess.to_i > SECRET_NUMBER
     message = "Too high!"
   elsif guess.to_i < SECRET_NUMBER - 5
     message = "Way too low!"
   elsif guess.to_i < SECRET_NUMBER
     message = "Too low!"
   else
     message = "THE SECRET NUMBER IS #{SECRET_NUMBER}! YOU GOT IT RIGHT!"
   end

 end



get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  erb:index, :locals => {:number => SECRET_NUMBER, :message => message, :color => color}
end
