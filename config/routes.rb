Rails.application.routes.draw do
  defaults format: :json do
    resources :users, only: [:index, :create, :update]
    resources :regions, only: [:index, :show]
    resources :prefectures, only: :index
    resources :practice_records
    resources :off_road_tracks
    resources :brands, only: [:index, :show]
    resources :models, only: :index
    resources :vehicles, only: [:index, :show, :create]
    resources :user_vehicles, only: [:index, :show, :create, :update, :destroy] do
      get 'total_times', on: :member
    end
    resources :current_vehicles, only: [:index, :create]
    resources :periodic_maintenances, only: [:index, :show, :create, :update, :destroy]
    resources :maintenance_categories, only: [:index, :show, :create, :update, :destroy]
    resources :maintenance_menus, only: [:index, :create, :update, :destroy]
    resources :maintenance_records, only: [:index, :show, :create, :update, :destroy]
    resource :operation_time, only: :show
    resources :roles, only: :index
  end
end
