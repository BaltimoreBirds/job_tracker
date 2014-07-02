class RenameSessionsTable < ActiveRecord::Migration
    def change
	  	drop_table :sessions

	    create_table :job_sessions do |t|
	        t.integer :job_id
	        t.string :session_title
	        t.string :session_goals

	        t.timestamps
	    end
	end
end
