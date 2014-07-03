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
		expect(page).to have_content('Job Tracker')
		click_link('Sign in')
	end
	scenario 'User sees their jobs upon sign in' do 
		expect(page).to have_content('Job Tracker')
		
	end
end