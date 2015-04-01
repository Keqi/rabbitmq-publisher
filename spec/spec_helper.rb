RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.before :each do
    stub_request(:get, "http://openexchangerates.org/api/latest.json?app_id=#{Rails.application.secrets.api_key}").
      with(:headers => {'User-Agent'=>'Typhoeus - https://github.com/typhoeus/typhoeus'}).
      to_return(:status => 200, :body => File.read(Rails.root.join("spec/fixtures/latest.json")), :headers => {})
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

end