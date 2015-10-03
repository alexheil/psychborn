Rails.application.routes.draw do

  root 'static_pages#home'

  get 'privacy' => 'static_pages#privacy'
  get 'terms_of_use' => 'static_pages#terms_of_use'
  get 'contact' => 'static_pages#contact'
  get 'about' => 'static_pages#about'
  get 'landing' => 'static_pages#landing'

  devise_for :admins, controllers: { sessions: "admins/sessions", passwords: "admins/passwords", registrations: "admins/registrations", confirmations: "admins/confirmations",  unlocks: "admins/unlocks"}

  devise_scope :admin do
    get "sign_out", to: "admins/sessions#destroy"
  end

  resources :posts, controller: 'posts/posts', except: :index

end
