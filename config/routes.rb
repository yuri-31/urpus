Rails.application.routes.draw do
  
  root to: 'public/homes#top'
  get '/about' => 'public/homes#about', as: 'about'
  get '/admin' => 'admin/homes#top', as: 'admin_top'
  
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
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
  
  
  get '/users/my_page' => 'public/users#my_page', as: 'my_page'
  get '/users/info/edit' => 'public/users#edit', as: 'edit_user'
  patch '/users/info' => 'public/users#update', as: 'update_user'
  get '/users/unsubscribe' => 'public/users#unsubscribe', as: 'unsubscribe'
  patch '/users/withdraw' => 'public/users#withdraw', as: 'withdraw'
  
  get '/books/edit' => 'public/books#edit', as: 'edit_books'
  patch '/books/status/:id' => 'public/books#update_status', as: 'update_book_status'
  get '/books/library/:id' => 'public/books#library', as: 'book_library'
  # get 'books/find' => 'public/books#find', as: 'find_book'
  
  get '/pages/edit' => 'public/pages#edit', as: 'edit_pages'
  get '/pages/library/:id' => 'public/pages#library', as: 'page_library'
  
  patch '/words/status/:id' => 'public/words#update_status', as: 'update_word_status'
  get '/words/dictionary' => 'public/words#index', as: 'dictionary'
  
  scope module: 'public' do
    resources :books, only: [:new, :index, :create, :show, :update, :destroy]
    resources :pages, only: [:create, :show, :update, :destroy]
    resources :users, only: [:show]
    resources :words, only: [:show, :create, :edit, :update, :destroy]
    resources :topics, only: [:index]
    resources :columns, only: [:show]
    resources :meanings, only: [:update, :create]
    resources :examples, only: [:update, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
