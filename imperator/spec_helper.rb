require 'rspec'
require 'rspec-benchmark'
require 'airborne'
require_relative 'yes_no_formatter'

RSpec.configure do |config|
  config.include RSpec::Benchmark::Matchers
  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  # config.default_formatter = YesNoFormatter

  if config.files_to_run.one?
    config.full_backtrace = true

    config.default_formatter = 'doc'
  end

  config.disable_monkey_patching!
  config.warnings = false

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
    mocks.verify_doubled_constant_names = true
  end
end
