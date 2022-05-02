Rails.application.routes.draw do
  root 'doctors#home'

  use_doorkeeper
  devise_for :users

  draw :api
  
end
