Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  root 'clients#home'

  use_doorkeeper
  devise_for :users

  draw :api
  
end
