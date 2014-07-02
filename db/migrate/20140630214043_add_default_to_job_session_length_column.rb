class AddDefaultToJobSessionLengthColumn < ActiveRecord::Migration
  def change
  	change_column :job_sessions, :length, :integer, default: 0
  end
end
