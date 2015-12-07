class ItemsController < ApplicationController
  # CRUD routes -- dealing with the items table


  # read (show list)
  get "/" do
    # grab the current_user id
    @user = session[:current_user].id
    # get all items tied to user id from DB
    @items = Item.where(user_id: @user)
    # show the items using read.erb
    erb :read
  end



  # create (add to the list)
  get "/create" do
    # show the view
    erb :create
  end
  post "/create" do
    # p params
    # get the info from the form and save into DB
    @item = Item.new
    @item.name = params[:name]
    @item.quantity = params[:quantity]
    @item.user_id = session[:current_user].id
    @item.save
    # display a message confirming the addition
    @message = "You have added " + @item.name + " to your list!"
    # show the view
    erb :message
  end



  # update (change a current item)
  get "/update/:id" do
    # find the item row by id
    @item = Item.find(params[:id])
    # show the view
    erb :update
  end
  post "/update" do
    # p params
    # get the info from the form and save it
    @item = Item.find(params[:id])
    @item.name = params[:name]
    @item.quantity = params[:quantity]
    @item.user_id = session[:current_user].id
    @item.save
    # display a message confirming the addition
    @message = "You have updated " + @item.name + "!"
    # show the view
    erb :message
  end



  # destroy (remove an item from the list (and database))
  get "/destroy/:id" do
    # p params
    # find the item row by id
    @item = Item.find(params[:id])
    # show the view
    erb :destroy
  end
  post "/destroy" do
    # find the item row by id and destroy (remove from DB)
    @item = Item.find(params[:id])
    @item.destroy
    # show the view
    @message = "Your item has been removed!"
    erb :message
  end

end # end of class
