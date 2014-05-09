require 'spec_helper'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/cassette_library'
  c.hook_into :webmock
  c.ignore_localhost = true
  c.default_cassette_options = { :record => :none,
                                 :re_record_interval => 7.days }
end

RSpec.configure do |c|
  c.extend VCR::RSpec::Macros
end