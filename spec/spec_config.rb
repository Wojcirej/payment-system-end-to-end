require './config/application'
require 'capybara/rspec'
require 'capybara-screenshot/rspec'
require 'capybara/cuprite'
require_all './spec/helpers/'
require_all './spec/factories/'
secrets = YAML::load_file(File.join('config', 'application.yml'))

Capybara.always_include_port = true
Capybara.run_server = false
Capybara.default_max_wait_time = 10
Capybara.javascript_driver = :cuprite
Capybara.app_host = "#{secrets['REMOTE_PROTOCOL']}://#{secrets['REMOTE_DOMAIN']}"
Capybara.default_host = Capybara.app_host
Capybara.save_path = "screenshots/"

RSpec.configure do |config|
  config.default_formatter = "doc"
  config.profile_examples = 10
  config.order = :random
  config.expect_with :rspec do |c|
    c.syntax = [:expect]
  end
  config.include GeneralRemoteHelpers
end

Capybara.register_driver :cuprite do |app|
  Capybara::Cuprite::Driver.new(app, {
    window_size: [1680, 1050],
    url_whitelist: [Capybara.app_host, secrets['REMOTE_BACKEND_URL']]
    })
end
