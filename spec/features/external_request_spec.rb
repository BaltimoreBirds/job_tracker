require 'spec_helper'

feature 'External request' do
  it 'queries FactoryGirl contributors on Github' do
    uri = URI('https://api.github.com/repos/thoughtbot/factory_girl/contributors')

    response = JSON.load(Net::HTTP.get(uri))

    expect(response.first['login']).to eq 'jferris'
  end
end