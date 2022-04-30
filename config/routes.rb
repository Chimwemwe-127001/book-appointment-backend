Rails.application.routes.draw do
  devise_for :users
  root 'doctors#home'
end
