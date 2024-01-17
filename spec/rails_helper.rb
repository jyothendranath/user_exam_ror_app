
ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../config/environment', __dir__)

require 'rspec/rails'
require 'factory_bot'



Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }

RSpec.configure do |config|

  config.include FactoryBot::Syntax::Methods



  config.fixture_path = "#{::Rails.root}/spec/fixtures"

end
