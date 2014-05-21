class JobsController < ApplicationController
	respond_to :html, :json

	def index
	end

	def createRepo
		client = Octokit::Client.new(:access_token => session[:token])
	    client.create_repository(params[:repoName])
		@job = Job.new
		@job.github_repo = 'https://github.com/'+current_user?.display_name+'/'+params[:repoName]
		gon.job_var = @job.github_repo
	    respond_to do |format|
	        format.json  { render json:  @job }
	    end
    rescue Octokit::UnprocessableEntity
    	@job = Job.new
	    flash[:notice] = "Repository Name is already taken. Please choose another"
	    render action: 'new'
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