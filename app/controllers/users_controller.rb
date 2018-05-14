class UsersController < ApplicationController
	before_action :user_set, only: [:edit,:update,:destroy,:show]
	before_action :authenticate_user!
	protect_from_forgery prepend: true
	def index
		@users = User.all
	end
	def new
		@user=User.new
	end	

	def create
		#render plain: params[:description].inspect
		@user=User.new(user_params)
		if @user.save
			flash[:notice] = "success"
			redirect_to user_path(@user)
		else
			render 'new'
		end
	end

	def show
		
	end

	def edit
		
	end

	def destroy
		
		if @user.destroy
			flash[:notice]="Deleted"
			redirect_to user_path
		else
			render 'index'
		end
	end

	def update
		
		if @user.update(user_params)
			flash[:notice] = "success"
			redirect_to user_path(@user)
		else
			render 'edit'
		end
	end

	private
		def user_params
			params.require(:user).permit(:name, :email, :password)
		end
		def user_set
			@user= User.find(params[:id])
		end

		
	

end	