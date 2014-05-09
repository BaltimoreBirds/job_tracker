require'spec_helper'

require 'spec_helper'

feature 'User creates and views jobs', %Q{
	As a registered user, 
	I want to create a new job, 
	So that I may begin tracking a work sessions commit's 

	- On sign in, User is taking to a job board
	- Job board displays all past jobs and current jobs, current jobs at top. 
	- there is a new job button which opens a new job form.
		- job is linked to a specific github repo(a job or project repo)

	- job is created and user is taken to that job page.
	- a job's page has a timer to being a new session
	- a job's page also shows past work sessions and commits 
		related those specific sessions
	- Each session has a timer to start, and description field to outline goals, notes etc. 

} do

	scenario 'User creates a new Job' do
		visit '/' 
		expect(page).to have_content('Job Tracker')
		click_link('Sign in with GitHub')

		
				
	end

end