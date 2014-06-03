require'spec_helper'


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

	before(:each) do
		visit '/' 
		expect(page).to have_content('Job Tracker')
		click_link('Sign in')
		user = User.first

		expect(page).to have_content('Sign Out')
		expect(page).to_not have_content('Sign in')
		click_link('Start a new Job')
		expect(page).to have_content('Start a new Job')
	end

	scenario 'User creates a new Job, sees Job page' do
		prev_count = Job.count
		fill_in 'job_title', with: 'Fake Job'
		fill_in 'job_github_repo', with: 'https://github.com/BaltimoreBirds/job_tracker'
		fill_in 'job_description', with: 'goal one, goal two'
		click_button('Create Job')
		expect(page).to have_content('Job Created')
		expect(Job.count).to eql(prev_count + 1)

		expect(page).to have_content('Fake Job')
		expect(page).to have_content('https://github.com/BaltimoreBirds/job_tracker')
		expect(page).to have_content('goal one, goal two')

		user = User.first
		expect(user.jobs.first.class).to eql(Job)
		expect(page).to have_content('goal one, goal two')
	end

	scenario 'User inputs bad github_repo link' do
		prev_count = Job.count
		expect(page).to have_content('Start a new Job')
		fill_in 'job_title', with: 'Fake Job'
		fill_in 'job_github_repo', with: 'alfalfa'
		fill_in 'job_description', with: 'goal one, goal two'
		click_button('Create Job')
		expect(page).to have_content('is invalid')
		expect(Job.count).to eql(prev_count)
	end

	# User inputs repo name that's already take

end