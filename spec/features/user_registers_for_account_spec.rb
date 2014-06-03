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
		click_link('Sign in')

		expect(User.count).to eql(prev_count + 1)
			
	end

	scenario 'Existing(signed out) user signs in with github' do 

		user = FactoryGirl.create(:user)
		prev_count = User.count
		visit '/'
		click_link('Sign in') 

		expect(User.count).to eql(prev_count)
	end

	scenario 'Signed in user visits site ' do 


		user = FactoryGirl.create(:user)
		page.set_rack_session(:uid => user.github_uid) # Uses rack_session_access gem
		visit '/'
		expect(page).to_not have_content('Sign in')
		expect(page).to have_content('Sign Out')

	end

end