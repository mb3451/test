class ProjectsController < ApplicationController
	
	before_action :authenticate_user!
	load_and_authorize_resource

	before_action :project_set, only: [:edit,:update,:destroy,:show]
	# before_action :check_manager, only: [:edit,:update,:destroy]
	
	def index
		@projects = Project.all
	end

	def new
		@project = Project.new
	end	

	def create
		@project = Project.new(project_params)
		@project.manager_id = current_user.id
		if @project.save
			flash[:notice] = "success"
			redirect_to project_path(@project)
		else
			render 'new'
		end
	end

	def show
		
	end

	def edit
		
	end

	def destroy
		if @project.destroy
			flash[:notice] = "Deleted"
			redirect_to projects_path
		else
			render 'index'
		end
	end

	def update
		if @project.update(project_params)
			flash[:notice] = "success"
			redirect_to project_path(@project)
		else
			render 'edit'
		end
	end

	private

		# def check_manager
		# 	if @project.manager_id != current_user.id
		# 		flash[:notice] = "Not Authorized"
		# 		redirect_to projects_path
		# 	end
		# end

		def project_params
			params.require(:project).permit(:name, user_ids: [])
		end

		def project_set
			@project= Project.find(params[:id])
		end
end	