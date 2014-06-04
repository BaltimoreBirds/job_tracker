require 'spec_helper'

describe JobSession do
    it { should belong_to :job}
    it { should have_valid(:job_id).when(1)}
    it { should_not have_valid(:job_id).when('string', nil) }
    it { should have_valid(:session_title).when('string') }
    it { should_not have_valid(:session_title).when(' ', nil) }

end
