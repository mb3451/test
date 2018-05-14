class DescriptionsController < ApplicationController
	before_action :description_set, only: [:edit,:update,:destroy,:show]
	def index
		@descriptions = Description.all
	end
	def new
		@description=Description.new
	end	

	def create
		#render plain: params[:description].inspect
		@description=Description.new(description_params)
		if @description.save
			flash[:notice] = "success"
			redirect_to description_path(@description)
		else
			render 'new'
		end
	end

	def show
		
	end

	def edit
		
	end

	def destroy
		
		if @description.destroy
			flash[:notice]="Deleted"
			redirect_to descriptions_path
		else
			render 'index'
		end
	end

	def update
		
		if @description.update(description_params)
			flash[:notice] = "success"
			redirect_to description_path(@description)
		else
			render 'edit'
		end
	end

	private
		def description_params
			params.require(:description).permit(:title, :description)
		end
		def description_set
			@description= Description.find(params[:id])
		end

		
	

end	