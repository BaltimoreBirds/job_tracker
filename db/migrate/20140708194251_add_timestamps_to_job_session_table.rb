class AddTimestampsToJobSessionTable < ActiveRecord::Migration
  def change
  	    add_column(:job_sessions, :created_at, :datetime)
        add_column(:job_sessions, :updated_at, :datetime)
  end
end
