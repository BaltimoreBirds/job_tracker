require 'spec_helper'

describe JobSession do
    it { should belong_to :sessionable}
    it { should have_valid(:sessionable_id).when(1)}
    it { should_not have_valid(:sessionable_id).when('string', nil) }
    it { should have_valid(:sessionable_type).when('string')}
    it { should_not have_valid(:sessionable_type).when(nil) }
    it { should have_valid(:session_title).when('string') }
    it { should_not have_valid(:session_title).when(' ', nil) }

end
