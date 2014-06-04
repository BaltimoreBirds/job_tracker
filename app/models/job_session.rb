class JobSession < ActiveRecord::Base
	# belongs_to :job
	belongs_to :sessionable, polymorphic: true
	validates_presence_of :session_title
	validates_presence_of :sessionable_id
	validates_presence_of :sessionable_type
	validates_numericality_of :sessionable_id
end
