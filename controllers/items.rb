class ItemsController < ApplicationController

  get "/" do
      @user = session[:current_user].id
      @items = Item.where(user_id: @user)
      erb :read
    end

  get "/create" do
    erb :create
  end
  post "/create" do

    @item = Item.new
    @item.name = params[:name]
    @item.quantity = params[:quantity]
    @item.user_id = session[:current_user].id
    @item.save
    @message = "You have added " + @item.name + " to your shopping list."
    erb :message
  end

 get "/update/:id" do
   @item = Item.find(params[:id])
   erb :update
 end
 post "/update" do

   @item = Item.find(params[:id])
   @item.name = params[:name]
   @item.quantity = params[:quantity]
   @item.user_id = session[:current_user].id
   @item.save
   @message = "You have updated " + @item.name + "."
   erb :message
 end

   get "/destroy/:id" do

     @item = Item.find(params[:id])
     erb :destroy
   end
   post "/destroy" do
     @item = Item.find(params[:id])
     @item.destroy
     @message = "Your item has been deleted."
     erb :message
   end

 end
