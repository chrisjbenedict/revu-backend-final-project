class Api::V1::AuthController < ApplicationController
	def login
		@user = User.find_by(username: params[:username])

		if @user && @user.authenticate(params[:password])
			token = encode_token(@user.id)

			render json: {user: @user, token: token}
		else
			render json: {errors: "Oops. Something went wrong. Make sure you entered the correct username and password!"}
		end
	end

	def get_user_from_token
			if curr_user
				render json: curr_user
			else
				render json: {errors: "User not found!"}
			end
	end
end
