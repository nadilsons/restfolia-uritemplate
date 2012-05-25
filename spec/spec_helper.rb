$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'restfolia_uri_template'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  FakeWeb.allow_net_connect = false

  def fixture(name)
    File.readlines("#{File.dirname(__FILE__)}/fixtures/#{name}").to_s
  end

  def register_uri(method, uri, options = {})
    options.merge!(:content_type => "application/json; charset=utf-8") unless options[:content_type].present?
    FakeWeb.register_uri(method, uri, options)
  end
end
