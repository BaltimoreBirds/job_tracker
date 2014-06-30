class AddLengthToJobSession < ActiveRecord::Migration
  def change
  	add_column :job_sessions, :length, :integer
  end
end
