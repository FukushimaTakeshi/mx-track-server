Rails.application.routes.draw do
  defaults format: :json do
    resources :users, only: [:create, :update]
    resources :regions, only: [:index, :show]
    resources :practice_records
    resources :off_road_tracks
    resources :brands, only: [:index, :show]
    resources :vehicles, only: [:index, :show]
    resources :user_vehicles, only: [:index, :show, :create, :update, :destroy]
    resources :current_vehicles, only: [:index, :create]
    resources :periodic_maintenances, only: [:index, :show, :create, :update, :destroy]
    resources :maintenance_menus, only: [:index]
    resources :maintenance_records, only: [:index, :show, :create, :update, :destroy]
    resource :operation_time, only: [:show]
  end
end
