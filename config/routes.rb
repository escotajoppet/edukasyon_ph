Rails.application.routes.draw do
  root to: 'students#index'

  resources :students do
    resources :class_schedules do
      member do
        post    'enroll'
        delete  'drop'
      end
    end
  end

  resources :subjects, :professors, :students do
  	resources :class_schedules do
      resources :reviews
    end
  end

  resources :subjects, :professors do
    resources :reviews
  end

  resources :subjects do
  	resources :professors
  end

  resources :professors do
  	resources :subjects
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
