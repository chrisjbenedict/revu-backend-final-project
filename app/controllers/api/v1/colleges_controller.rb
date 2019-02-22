class Api::V1::CollegesController < ApplicationController

  def index
    @colleges = College.all
    render json: @colleges
  end

end
