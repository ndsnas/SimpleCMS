Rails.application.routes.draw do




  root 'demo#index'

  resources :subjects do
    member do
      get :delete
    end
  end

  resources :pages do
    member do
      get :delete
    end
  end

  resources :sections do

    member do
      get :delete
      
    end

  end

  #get 'subjects/index'

  get 'demo/index'

  get 'demo/hello'

  get 'demo/hi'

  get 'demo/google'

  get 'example_controller/view1'
  #get 'ExampleController/view1'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
