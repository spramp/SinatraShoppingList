class HomeController < ApplicationController



  get "/" do
    erb :login
  end



  get "/not_authorized" do
    erb :not_authorized
  end



  not_found do
    erb :not_found
  end

end
