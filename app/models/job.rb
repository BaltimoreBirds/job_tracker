class Job < ActiveRecord::Base
	has_many :users, 
		through: :jobs_users
	has_many :jobs_users,
		inverse_of: :job

	validates_format_of :github_repo, with: URI.regexp
	validates_presence_of :github_repo, :title
	validates_uniqueness_of :github_repo
end
