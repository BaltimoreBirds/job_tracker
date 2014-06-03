require 'spec_helper'

describe 'vcr integration' do
  def make_http_request
  	@uri = URI.parse("http://localhost:3000/auth/github")
    @response = Net::HTTP.get_response(@uri)
  end


  context "without an explicit cassette name" do
    use_vcr_cassette 'oauth_github'

    it 'records an http request' do
      make_http_request.should be_true
    end
  end
end