require 'simplecov'

SimpleCov.start do
  add_group 'Yipit', 'lib/yipit'
  add_group 'Specs', 'spec'
end

require File.expand_path('../../lib/yipit', __FILE__)
require 'rubygems'
require 'rspec'
require 'vcr'

VCR.config do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.stub_with                :typhoeus
  c.default_cassette_options = { :record => :new_episodes }
end

RSpec.configure do |c|
  c.extend VCR::RSpec::Macros
end
