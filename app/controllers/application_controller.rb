class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

	# def current_user
 #        user = User.where(uid: session[:uid]).first
 #        return user
 #    end

    # def github_token
    #     session[:token]
    # end
end
