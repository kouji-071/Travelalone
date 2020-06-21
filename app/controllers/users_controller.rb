class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@posts = @user.posts
		@post = Post.new
	end

	def edit
		@user = User.find(params[:id])
		if current_user != @user
			redirect_to user_path(current_user)
		end
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
		redirect_to user_path(@user.id), notice: "変更しました。"
	else
		render :edit
	end
	end


	def aurhenticate_user
		if session[:user.id] == nil
			redirect_to ("new_user_session_path")
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :email, :introduction, :profile_image)
	end
end
