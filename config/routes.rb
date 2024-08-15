Rails.application.routes.draw do
  # Routes for the New diet request resource:

  # CREATE
  post("/insert_new_diet_request", { :controller => "new_diet_requests", :action => "create" })
          
  # READ
  get("/new_diet_requests", { :controller => "new_diet_requests", :action => "index" })
  
  get("/new_diet_requests/:path_id", { :controller => "new_diet_requests", :action => "show" })
  
  # UPDATE
  
  post("/modify_new_diet_request/:path_id", { :controller => "new_diet_requests", :action => "update" })
  
  # DELETE
  get("/delete_new_diet_request_admin/:path_id", { :controller => "new_diet_requests", :action => "destroy_admin" })
  get("/delete_new_diet_request/:path_id", { :controller => "new_diet_requests", :action => "destroy" })

  #------------------------------

  get("/", { :controller => "home", :action => "index" })
  get("/get_recommendations", { :controller => "groups", :action => "recommend" })
  
  # Routes for the Group resource:

  # CREATE
  post("/insert_group", { :controller => "groups", :action => "create" })
          
  # READ

  get("/groups", { :controller => "groups", :action => "index" })
  
  get("/groups/:path_id", { :controller => "groups", :action => "show" })
  
  # UPDATE
  
  post("/modify_group/:path_id", { :controller => "groups", :action => "update" })
  
  # DELETE
  get("/delete_group/:path_id", { :controller => "groups", :action => "destroy" })

  #------------------------------

  # Routes for the Restriction resource:

  # CREATE
  post("/insert_restriction", { :controller => "restrictions", :action => "create" })
          
  # READ
  get("/restrictions", { :controller => "restrictions", :action => "index" })
  
  get("/restrictions/:path_id", { :controller => "restrictions", :action => "show" })
  
  # UPDATE
  
  post("/modify_restriction/:path_id", { :controller => "restrictions", :action => "update" })
  
  # DELETE
  get("/delete_restriction/:path_id", { :controller => "restrictions", :action => "destroy" })

  #------------------------------

  # Routes for the Diet resource:

  # CREATE
  post("/insert_diet", { :controller => "diets", :action => "create" })
          
  # READ
  get("/diets", { :controller => "diets", :action => "index" })
  
  get("/diets/:path_id", { :controller => "diets", :action => "show" })
  
  # UPDATE
  
  post("/modify_diet/:path_id", { :controller => "diets", :action => "update" })
  
  # DELETE
  get("/delete_diet/:path_id", { :controller => "diets", :action => "destroy" })

  #------------------------------

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
