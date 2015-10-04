Rails.application.routes.draw do

  root 'static_pages#home'

  get 'privacy', to: 'static_pages#privacy'
  get 'terms_of_use', to: 'static_pages#terms_of_use'
  get 'contact', to: 'static_pages#contact'
  get 'about', to: 'static_pages#about'
  get 'landing', to: 'static_pages#landing'

  devise_for :admins, controllers: { sessions: "admins/sessions"}

  devise_scope :admin do
    get "sign_out", to: "admins/sessions#destroy"
  end

  resources :posts, controller: 'posts/posts', except: :index, path: ""

end
