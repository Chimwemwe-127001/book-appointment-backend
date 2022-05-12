# frozen_string_literal: true

class ApiController < ApplicationController
  include UserHelper
  before_action :doorkeeper_authorize!

  skip_before_action :verify_authenticity_token

  respond_to :json
end
