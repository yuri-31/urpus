Rails.application.routes.draw do
  
  root to: 'public/homes#top'
  get '/about' => 'public/homes#about', as: 'about'
  get '/admin' => 'admin/homes#top', as: 'admin_top'
  
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  devise_scope :user do
    post 'public/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end
  
  get '/admin/topics/edit' => 'admin/topics#edit', as: 'edit_topics'
  patch '/admin/column_status/:id' => 'admin/columns#update_status', as: 'update_column_status'
  
  namespace :admin do
    resources :topics, only: [:index, :create, :update, :destroy]
    resources :columns, only: [:new, :create, :edit, :update, :destroy]
    resources :users, only: [:index, :edit, :update]
  end
  
  
  get '/users/my_page' => 'public/users#show', as: 'my_page'
  get '/users/info/edit' => 'public/users#edit', as: 'edit_user'
  patch '/users/info' => 'public/users#update', as: 'update_user'
  get '/users/unsubscribe' => 'public/users#unsubscribe', as: 'unsubscribe'
  patch '/users/withdraw' => 'public/users#withdraw', as: 'withdraw'
  get '/users/books/edit' => 'public/books#edit', as: 'edit_books'
  get '/users/pages/edit' => 'public/pages#edit', as: 'edit_pages'
  patch '/words/status/:id' => 'public/words#update_status', as: 'update_word_status'
  get '/words/dictionary' => 'public/words#index', as: 'dictionary'
  
  scope module: 'public' do
    resources :books, only: [:index, :create, :show, :update, :destroy]
    resources :pages, only: [:create, :show, :update, :destroy]
    resources :words, only: [:create, :edit, :update, :destroy]
    resources :topics, only: [:index]
    resources :meanings, only: [:update, :create]
    resources :examples, only: [:update, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
