class JobsController < ApplicationController

	before_action :find_job, only:[:show, :edit, :update, :destroy]
	
	def index

		if params[:category].blank?
			@jobs = Job.all.order("created_at DESC")
			@category_name = "All Jobs"
		else
			@category_id = Category.find_by(name: params[:category]).id
			@category_name = Category.find_by(name: params[:category]).name	
			@jobs = Job.where(category_id: @category_id).order("created_at DESC")
		end
	end

	def show
		@job = find_job
	
	end

	def new
		@job = Job.new
	
	end
	

	def create
		@job = Job.new(jobs_params)
		@job.user_id = current_user.id
		
		if @job.save
			redirect_to @job
		else 
			render :new
	
		end
	end

	def edit
		@job = find_job
		unless current_user.id==blank?
			flash[:error] = "Fuck off thats not your job post!"
			redirect_to job_path
		end

		unless current_user.id==@job.user_id 
			flash[:error] = "Fuck off thats not your job post!"
			redirect_to job_path
		end
	
	end

	def update
		if @job.update(jobs_params)
			redirect_to @job
		else
			render "Edit"
		end
	
	end

	def destroy
		@job.destroy
		redirect_to root_path
	
	end


	 private
		def jobs_params
			params.require(:job).permit(:title, :company, :category_id, :description, :clinic_name)
		
		end

	 	def find_job
			@job = Job.find(params[:id])
		
	 	end
	 
end
