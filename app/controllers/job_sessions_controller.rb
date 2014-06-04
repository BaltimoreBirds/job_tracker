class JobSessionsController < ApplicationController

	def index
	end

	def create
		binding.pry
		@job = Job.where(id: params[:job_id]).first
		@job_session = @job.job_sessions.build(job_session_params)

		if @job_session.save
			# redirect_to :back, notice: "Your work session has begun."
		    respond_to do |format|
		    	format.html { redirect_to job_url(@job), notice: "Your work session has begun."}
		        # format.json { render json:  @job }
	 	    end
		else
			redirect_to :back, notice: "There was an error starting your session. Please try again. "
		end
	end

private
    def job_session_params
        params.require(:job_session).permit( :session_title, :session_goals, :sessionable_id, :sessionable_type)
    end
end