class JobSession < ActiveRecord::Base
	belongs_to :job
	validates_presence_of :session_title
	validates_presence_of :job_id
	validates_numericality_of :job_id
end
