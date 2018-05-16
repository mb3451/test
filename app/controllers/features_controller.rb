class FeaturesController < ApplicationController
	before_action :authenticate_user!
	load_and_authorize_resource
	before_action :feature_set, only: [:edit,:update,:destroy,:show]
	def index
		
		project = Project.find(params[:project_id])
    	@features = project.features
    	# render json: {"features" => @features}
    	respond_to do |format|
		  format.js {render layout: false} # Add this line to you respond_to block
		  format.html {} # Add this line to you respond_to block
		end
    
    	
    
   
	end
	
	def new
		
		project = Project.find(params[:project_id])
    	@feature = project.features.build
    	
   
	end	

	def create
		# render plain: params[:feature].inspect
		
		project = Project.find(params[:project_id])
    	@feature = project.features.create(feature_params)
    	@feature.creator_id = current_user.id
    	
		if @feature.save
			flash[:notice] = "success"
			redirect_to project_features_path
		else
			render 'new'
		end
	
	end

	def show
		
		
		
	end

	def edit
		
		
	end

	def destroy
		
		
		if @feature.destroy
			flash[:notice]="Deleted"
			redirect_to project_features_path
		else
			render 'index'
		end
	
	end

	def update
		
		if @feature.update(feature_params)
			flash[:notice] = "success"
			redirect_to project_features_path
		else
			render 'edit'
		end
	
	end

	private
		def feature_params
			params.require(:feature).permit(:avatars,:title,:description,:status,:feature_type,:developer_id,:project_id)
		end
		def feature_set
			@feature= Feature.find(params[:id])
		end

		
	

end	