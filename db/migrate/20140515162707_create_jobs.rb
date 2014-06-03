class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title, null: false
      t.text :description
      t.string :github_repo, null: false

      t.timestamps
    end
  end
end
