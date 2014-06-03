require 'spec_helper'

describe JobUsers do
  	it {should belong_to(:job)}
	it {should belong_to(:user)}
end
