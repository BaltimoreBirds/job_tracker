class JobsController < ApplicationController
	respond_to :html, :json

	def index
	end

	def new
		@job = Job.new
	end

	def show
		@job = Job.find(params[:id])
		respond_with @job
	end

	def create
		@job = Job.new(job_params)

		if @job.save
			redirect_to @job, notice: "Job Created"
		else
			render action: 'new', notice: "There was an error, Try again."
		end
	end

private
    def job_params
        params.require(:job).permit( :description, :title, :github_repo)
    end
end