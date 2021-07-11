Rails.application.routes.draw do
  defaults format: :json do
    resources :users, only: [:create]
    resources :regions, only: [:index, :show]
    resources :practice_records
    resources :off_road_tracks
  end
end
