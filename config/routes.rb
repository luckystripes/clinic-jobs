Rails.application.routes.draw do


 root 'jobs#index'
 get '/jobs' => 'jobs#index'
 post '/jobs' => 'jobs#create'
 get 'jobs/new' => 'jobs#new', as: :new_job
 get 'jobs/:id/edit' => 'jobs#edit', as: :edit_job
 get 'jobs/:id' => 'jobs#show', as: :job
 put 'jobs/:id' => 'jobs#update'
 patch 'jobs/:id' => 'jobs#update'
 delete 'jobs/:id' => 'jobs#destroy'

# signup
 get "/users" => "jobs#index"
 post "/users" => "users#create"
 get "/signup" => "users#new"

#login
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"

end
