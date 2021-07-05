Rails.application.routes.draw do
  resources :users, only: [:create]
  resources :practice_records
  resources :off_road_tracks
end
