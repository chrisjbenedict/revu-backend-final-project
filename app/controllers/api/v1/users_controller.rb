class Api::V1::UsersController < ApplicationController

  def create
		@user = User.new(
			username: params[:username],
			password: params[:password]
		)

		if @user.save
			token = encode_token(@user.id)

			render json: {user: @user, token: token}
		else
			render json: {errors: @user.errors.full_messages}
		end
	end

	def index
		render json: User.all
	end

	def show
		@user = User.find(params[:id])
		if @user
			if curr_user.id == @user.id
				render json: @user
			else
				render json: {errors: "Page unavailable."}
			end
		else
			render json: {errors: "User not found."}
		end
	end

end
