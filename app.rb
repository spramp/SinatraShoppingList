require 'bundler'
Bundler.require()

get '/' do

  erb :index

end

get '/login' do

  erb :login

end

get '/registration' do

  erb :registration

end
