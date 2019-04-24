require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/rps_model.rb')

also_reload('./models/*')

get '/welcome' do 
  erb( :welcome )
end

get '/game/:hand1/:hand2' do
  hand1 = params[:hand1]
  hand2 = params[:hand2]
  @winner = RPSGame.check_win(hand1, hand2)
  erb( :result )
end
