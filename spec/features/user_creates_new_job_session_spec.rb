require'spec_helper'


feature 'User creates and views jobs', %Q{
	As a Job Tracker
	I want to start and stop a timer 
	so that I can track a current work session. 

	-Job timer form filled out with goals of work session, session title
	***Add a feature Model that sessions can belong too???***  
	-Timer is started, time is tracked, all subsequent commits tracked in session log. 
	-Timer is stopped. Session is logged. 

} do
	before(:each) do 
		visit '/' 
		expect(page).to have_content('Job Tracker')
		click_link('Sign in')
		click_link('Start a new Job')
		fill_in 'job_title', with: 'Fake Job'
		fill_in 'job_github_repo', with: 'https://github.com/BaltimoreBirds/job_tracker'
		fill_in 'job_description', with: 'goal one, goal two'
		click_button('Create Job')
	end

	scenario 'User creates a job session with valid info' do 
		expect(page).to have_content('Job Created')

		expect(page).to have_content('Start a new job session')
		expect(page).to have_content('00:00')

		fill_in 'job_session[session_goals]', with: 'Hurr Durr CODE THIS'
		fill_in 'job_session[session_title]', with: 'testing User input'
		click_button('Start Session')
		expect(page).to have_content('testing User input')

	end

end