# frozen_string_literal: true

class ClientsController < ApplicationController
  # before_action :authenticate_user!
  def home
    # render json: 'This is the doctor api home page' #, status: :ok
    @application = Doorkeeper::Application.find_by(name: 'React')

    @application = {
      name: @application.name,
      client_id: @application.uid,
      client_secret: @application.secret
    }
  end
end
