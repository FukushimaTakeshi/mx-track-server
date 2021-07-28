Rails.application.routes.draw do
  defaults format: :json do
    resources :users, only: [:create, :update]
    resources :regions, only: [:index, :show]
    resources :practice_records
    resources :off_road_tracks
    resources :brands, only: [:index]
    resources :vehicles, only: [:index, :show]
  end
end
