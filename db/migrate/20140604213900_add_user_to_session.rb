class AddUserToSession < ActiveRecord::Migration
  def change
  	drop_table :job_sessions
  	create_table :job_sessions do |t|
  		t.string :session_title
  		t.string :session_goals
  		t.references :sessionable, polymorphic: true
  	end
  	# add_column :job_sessions, :sessionable, :references, polymorphic: true
  		# t.references :sessionable, polymorphic: true
  	# remove_column :job_sessions, :job_id

  end
end
