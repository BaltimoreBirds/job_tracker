require'spec_helper'


feature 'User creates and views jobs', %Q{
	As a tracker 
	I want to view a board listing JobSessions 
	so that I can organize and search for jobs

	- Job page lists a users Jobs 
	- accordian dealy reveals the basic job details. 
	- clickable jobs go to their respective job page.
} do
	before(:each) do 
		visit '/' 
		expect(page).to have_content('TrackIT')
		click_link('Sign in')
		user = User.where(github_uid: '4583382').first
		job = FactoryGirl.create(:job, id: 2)
		job_user = FactoryGirl.create(:jobs_user, user_id: user.id, job_id: 2)
		click_link('Start a new Job')
		fill_in 'job_title', with: 'Fake Job'
		fill_in 'job_github_repo', with: 'https://github.com/BaltimoreBirds/job_tracker'
		fill_in 'job_description', with: 'goal one, goal two'
		click_button('Create Job')
	end
	scenario 'User sees their jobs upon sign in' do 
		visit '/'
		expect(page).to have_content('Fake Job')
		expect(page).to have_content('goal one, goal two')
		expect(page).to have_content('MyString')
		expect(page).to have_content('My goals, your goals')
	end
end