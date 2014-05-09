require 'spec_helper'

feature 'User signs in with github', %Q{
	As an unregistered user
	I want to register with my github account
	So that I will have a profile by which jobs are organized. 

	Acceptance Critera
	- unregistered users see register button on home page.
	- user can login with a github account. 
	- upon registration, user is taken to user job board page. 
} do

	scenario 'User signs in with github' do

		prev_count = User.count
		visit '/' 
		expect(page).to have_content('Job Tracker')
		click_link('Sign in with GitHub')

		expect(User.count).to eql(prev_count + 1)
			
	end

end