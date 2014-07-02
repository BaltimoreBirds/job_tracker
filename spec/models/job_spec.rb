require 'spec_helper'

describe Job do
  it{should have_many :users}
  it{ should have_many :job_sessions}

  it { should have_valid(:title).when('string') }
  it { should_not have_valid(:title).when(' ', nil) }
  it { should allow_value('http://foo.com', 'http://bar.com/baz').for(:github_repo) }
  it { should_not allow_value('asdfjkl').for(:github_repo) }
  it { should_not allow_value(' ', nil).for(:github_repo) }
  it do 
	  Job.create!(title: 'This is the title', github_repo: 'http://foo.com')
	  should validate_uniqueness_of(:github_repo)
	end
end
