
namespace :api do
  namespace :v1 do
    scope :users, module: :users do
      post '/', to: 'registrations#create', as: :user_registration
    end
    resources :doctors
  end
end 

scope :api do
  scope :v1 do
    use_doorkeeper do
      skip_controllers :authorizations, :applications, :authorized_applications
    end
  end
end

namespace :api do
  namespace :v1 do
      get '/doctors', to: 'doctors#index'
      post '/doctors/create', to: 'doctors#create'
      delete '/doctor/delete', to: 'doctors#destroy'
end
end