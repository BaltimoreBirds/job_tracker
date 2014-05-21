class SessionsController < ApplicationController
require "uri"
require "net/http"	
require 'pry'

	respond_to :html, :json


	def create
		binding.pry
		# client = OAuth2::Client.new(ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], :site => 'http://localhost:3000')
		@auth = request.env["omniauth.auth"]
	    @token = @auth["credentials"]["token"]
	    session[:uid] = @auth.uid	
	    session[:token] = @token
	    @code = params[:code] 
		
		create_github_user
 	end

 	def get_access_token

		# 'redirect_uri' => 'http://localhost:3000/auth/github/callback'
	    result = RestClient.post('https://github.com/login/oauth/access_token',
              {:client_id => ENV['GITHUB_KEY'],
               :client_secret => ENV['GITHUB_SECRET'],
               :code => @code},
               :accept => :json)
 	end

	def destroy
	    [:uid, :token].each do |key|
	      session[key] = nil
	    end
	    # binding.pry
	    redirect_to root_path
	    flash[:notice] = "You are now logged out."
	end

	def create_github_user
		@user = User.find_for_github_oauth(@auth.uid, @auth.info.name, @auth.info.email, @auth.info.nickname)

	    if @user.persisted? 
	      redirect_to root_path, notice: 'You have successfully signed in!'
	    else
	      redirect_to root_path
	      flash[:notice] = "There was a problem signing you in. Please try again."
	    end
	end

end