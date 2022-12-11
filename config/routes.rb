Rails.application.routes.draw do
  
  root to: 'public/homes#top'
  get '/about' => 'public/homes#about', as: 'about'
  
  devise_for :admins
  
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  
  get '/users/my_page' => 'public/users#show', as: 'my_page'
  get '/users/info/edit' => 'public/users#edit', as: 'edit_user'
  patch '/users/info' => 'public/users#update', as: 'update_user'
  get 'users/unsubscribe' => 'public/users#unsubscribe', as: 'unsubscribe'
  patch 'users/withdraw' => 'public/users#withdraw', as: 'withdraw'
  
  scope module: 'public' do
    resources :books, only: [:index, :create, :show, :edit, :update, :destroy]
    resources :pages, only: [:create, :show]
    resources :words, only: [:create, :index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
