Rails.application.routes.draw do
  # get 'tests/index'
  # get 'tests/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :tests

  resources :tests do
    resources :questions do
      resources :answers
    end
  end
end
