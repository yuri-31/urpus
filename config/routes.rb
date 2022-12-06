Rails.application.routes.draw do
  
  root to: 'public/homes#top'
  get '/about' => 'public/homes#about', as: 'about'
  
  devise_for :admins
  
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  
  get '/users/my_page' => 'public/users#show', as: 'my_page'
  
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
