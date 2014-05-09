class User < ActiveRecord::Base

	has_many :jobs, 
		through: :user_jobs

	validates_presence_of :github_uid, :name, :email
	validates_uniqueness_of :github_uid, :display_name








	def self.find_for_github_oauth(uid, name, email, nickname)
	    user = User.where(github_uid: uid).first

	    if user
	        return user
	    else
	    	registered_user = User.where(:email => email).first
	    	if registered_user
	        	return registered_user
	    	else
	        	user = User.create(:name => name, :github_uid => uid, :email => email, :display_name => nickname)
	    	end
	    end
        user
	end
end
