class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :null_session

      # rescue_from Octokit::UnprocessableEntity, :with => :error_created

	def current_user?
        user = User.where(github_uid: session[:uid]).first
        return user
    end

private
	  def error_created(error)
	    return error.message
	  end 

end
