Rails.application.routes.draw do
  # Routes for the Friend resource:

  # CREATE
  post("/insert_friend", { :controller => "friends", :action => "create" })
          
  # READ
  get("/friends", { :controller => "friends", :action => "index" })
  
  get("/friends/:path_id", { :controller => "friends", :action => "show" })
  
  # UPDATE
  
  post("/modify_friend/:path_id", { :controller => "friends", :action => "update" })
  
  # DELETE
  get("/delete_friend/:path_id", { :controller => "friends", :action => "destroy" })

  #------------------------------

  devise_for :users

  root "home#index"
  
  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  # get "/your_first_screen" => "pages#first"
  
end
