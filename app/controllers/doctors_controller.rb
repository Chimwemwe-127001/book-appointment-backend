class DoctorsController < ApplicationController
  before_action :authenticate_user!
  def home
    # render json: 'This is the doctor api home page' #, status: :ok
  end
end
