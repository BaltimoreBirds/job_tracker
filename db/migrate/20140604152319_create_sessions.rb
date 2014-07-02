class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.integer :job_id
      t.string :session_title
      t.string :session_goals

      t.timestamps
    end
  end
end
