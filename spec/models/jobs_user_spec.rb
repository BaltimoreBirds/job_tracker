require 'spec_helper'

describe JobsUser do
	it {should belong_to(:job)}
	it {should belong_to(:user)}
end
