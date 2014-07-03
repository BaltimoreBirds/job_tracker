class JobSession < ActiveRecord::Base
	# belongs_to :job
	belongs_to :sessionable, polymorphic: true
	validates_presence_of :session_title
	validates_presence_of :sessionable_id
	validates_presence_of :sessionable_type
	validates_numericality_of :sessionable_id


	def humanize
	    [[60, :seconds], [60, :minutes], [24, :hours], [1000, :days]].map{ |count, name|
	        if self.length > 0
	            self.length, n = self.length.divmod(count)
	            "#{n.to_i} #{name}"
		    end
		}.compact.reverse.join(' ')
	end
end
