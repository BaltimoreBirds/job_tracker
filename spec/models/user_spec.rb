require 'spec_helper'

describe User do
  
  it{should have_many :jobs}

  it{should have_valid(:email).when('mike@aol.com')}
  it{should_not have_valid(:email).when(nil, ' ')}
  it{should have_valid(:name).when('herman')}
  it{should_not have_valid(:name).when(nil, ' ')}
  it{should have_valid(:github_uid).when('4873382')}
  it{should_not have_valid(:github_uid).when(nil, ' ')}

  it 'adds user new user to User database' do 
  	prev_count = User.count

  	# auth Mimicks the request.env["omniauth.auth"] response from oauth authorization
  	auth = {"provider"=>"github",
						 "uid"=>"4583382",
						 "info"=>
						  {"nickname"=>"BmoreBirds",
						   "email"=>"mikey@msn.com",
						   "name"=>"Michael Swain",
						   "image"=>"https://avatars.githubusercontent.com/u/4883382?",
						   "urls"=>
						    {"GitHub"=>"https://github.com/BaltimoreBirds",
						     "Blog"=>"http://baltimorebirds.github.io/"}},
						 "credentials"=>{"token"=>"089120u091412034u", "expires"=>false},
						 "extra"=>
						  {"raw_info"=>
						    {"login"=>"BaltimoreBirds"}
						   }
						}
	
	User.find_for_github_oauth(auth['uid'], auth['info']['name'], auth['info']['email'], auth['info']['nickname'])
	
	expect(User.first.github_uid).to eql("4583382")
	expect(User.first.email).to eql("mikey@msn.com")
	expect(User.count).to eq(prev_count + 1)
  end
  
end
