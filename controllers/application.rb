class ApplicationController < Sinatra::Base
  require 'bundler'
  Bundler.require

  ActiveRecord::Base.establish_connection(
    :database => 'shopping_list',
    :adapter => 'postgresql' #unless you're too hip ;)
  )

  set :views, File.expand_path('../../views', __FILE__)
  set :public_dir, File.expand_path('../../public', __FILE__)

  enable :sessions


  def does_user_exist(user_name)
    user = Account.find_by(:user_name => user_name)
    if user
      return true
    else
      return false
    end
  end

  def authorization_check
    if session[:current_user] == nil
      redirect "/login"
    else
      return true
    end
  end

end
