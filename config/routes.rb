Rails.application.routes.draw do
  root 'clients#home'

  use_doorkeeper
  devise_for :users

  draw :api
  
end
