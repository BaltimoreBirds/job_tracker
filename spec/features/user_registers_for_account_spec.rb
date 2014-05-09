require 'spec_helper'

feature 'unregistered user registers for account', %Q{
	As an unregistered user
	I want to register
	So that my jobs will be saved. 

	Acceptance Critera
	- unregistered users see register button on home page.
	- user can login with a github account. 
	- upon registration, user is taken to user job board page. 
} do

	scenario 'New user signs in with github' do

		prev_count = User.count
		visit '/' 
		expect(page).to have_content('Job Tracker')
		click_link('Sign in with GitHub')

		expect(User.count).to eql(prev_count + 1)
			
	end

end