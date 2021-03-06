ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.include Requests::JsonHelpers, type: :controller
  config.include FactoryGirl::Syntax::Methods
  config.warnings = false
end
