class UserController < ApplicationController


    get "/" do
      authorization_check
      @user_name = session[:current_user].user_name
      redirect "/items/"
    end



    get "/not_authorized" do
      erb :not_authorized
    end




    get "/register" do
      erb :register
    end
    post "/register" do
      if does_user_exist(params[:user_name]) == true
        return {:message => "user already exists"}.to_json
      end
      if (params[:user_email] != "" && params[:user_name] != "" && params[:password] != "")
        user = Account.create(user_email: params[:user_email], user_name: params[:user_name], password: params[:password])
        session[:current_user] = user
        redirect "/items/"
      else
        @message = "All fields must have a value"
        erb :register
      end
    end



    get "/login" do
      erb :login
    end
    post "/login" do
      if (does_user_exist(params[:user_name]) == true &&
         params[:password] != "")
        user = Account.authenticate(params[:user_name], params[:password])
        if user
          session[:current_user] = user
          redirect "/items/"
        else
          @message = "Your password or account information is incorrect"
          erb :login
        end
      else
        redirect "/users/login"
      end
    end

    get "/logout" do
      authorization_check
      session[:current_user] = nil
      redirect "/"
    end

end
