# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rails'
require 'capybara/rspec'
require 'webmock/rspec'
require 'shoulda/matchers'
require 'vcr'
require "rack_session_access/capybara"
# require 'sinatra'


# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

WebMock.allow_net_connect!

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({"provider"=>"github", "uid"=>"4583382", "info"=>{"nickname"=>"BmoreBirds", "email"=>"mikey@msn.com", "name"=>"Michael Swain", "urls"=>{"GitHub"=>"https://github.com/BmoreBirds", "Blog"=>"http://baltimorebirds.github.io/"}}, "credentials"=>{"token"=> '089120u091412034u', "expires"=>false}, "extra"=>{"raw_info"=>{"login"=>"BmoreBirds", "id"=>4883382, "avatar_url"=>"", "gravatar_id"=>"bdba274b3c08e0803e4", "url"=>"https://api.github.com/users/BmoreBirds", "html_url"=>"https://github.com/BaltimoreBirds", "followers_url"=>"https://api.github.com/users/BaltimoreBirds/followers", "following_url"=> "https://api.github.com/users/BaltimoreBirds/following{/other_user}", "gists_url"=> "https://api.github.com/users/BaltimoreBirds/gists{/gist_id}", "starred_url"=> "https://api.github.com/users/BaltimoreBirds/starred{/owner}{/repo}", "subscriptions_url"=> "https://api.github.com/users/BaltimoreBirds/subscriptions", "organizations_url"=>"https://api.github.com/users/BaltimoreBirds/orgs", "repos_url"=>"https://api.github.com/users/BaltimoreBirds/repos", "events_url"=> "https://api.github.com/users/BaltimoreBirds/events{/privacy}", "received_events_url"=> "https://api.github.com/users/BaltimoreBirds/received_events", "type"=>"User", "site_admin"=>false, "name"=>"Michael Swanson", "company"=>"The Lukens Company", "blog"=>"http://baltimorebirds.github.io/", "location"=>"Baltimore, MD", "email"=>"mikey@msn.com", "hireable"=>true, "bio"=>nil, "public_repos"=>28, "public_gists"=>7, "followers"=>0, "following"=>5, "created_at"=>"2013-06-29T14:37:34Z", "updated_at"=>"2014-05-06T20:51:23Z"}}})

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"

end
