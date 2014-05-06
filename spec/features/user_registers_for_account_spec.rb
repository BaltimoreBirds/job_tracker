require 'spec_helper'

features 'unregistered user registers for account', %Q{
	As an unregistered user
	I want to register
	So that my jobs will be saved. 

	Acceptance Critera
	- unregistered users see register button on home page.
	- user can login with a github account. 
	- upon registration, user is taken to user job board page. 
} do

	scenario 'New user signs in with github' do

		use_vcr_cassette "feed", :record => :new_episodes


		prev_count = User.count
		visit '/' 
		expect(page).to have_content('Job Tracker')
		click_on 'Sign in with Github'

		expect(page).to have_content('Sign up with your Github Account.')
		fill_in "Email", with: 
		fill_in "Password", with: 
	end
	
end