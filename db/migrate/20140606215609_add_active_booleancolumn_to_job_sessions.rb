class AddActiveBooleancolumnToJobSessions < ActiveRecord::Migration
  def change
  	add_column :job_sessions, :active, :boolean
  end
end
