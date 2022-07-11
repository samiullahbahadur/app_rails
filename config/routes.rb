Rails.application.routes.draw do
  
  #get 'article/index'
  root 'home#index'

 #get 'articles/new', to: 'articles#new'
 resources  :articles

 get 'signup'=> 'users#new'
 resources  :users, except: [:new]

 get 'sign_in', to: "sessions#new"
 post 'sign_in', to: "sessions#create"
 delete 'logout' => 'sessions#destroy'



 

end
