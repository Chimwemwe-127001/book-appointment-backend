Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users
  root 'doctors#home'

  draw :api
end
