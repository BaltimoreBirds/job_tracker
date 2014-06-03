require 'spec_helper'

describe JobsUsers do
	it {should belong_to(:job)}
	it {should belong_to(:user)}
end
