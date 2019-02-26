class Api::V1::CollegesController < ApplicationController

  def index
    @colleges = College.all
    render json: @colleges
  end

  def show
    @college = College.find(params[:id])
    render json: @college, status: :ok
  end

  # private
  #
  # def college_params
  #   params.require(:college).permit()
  # end

end
