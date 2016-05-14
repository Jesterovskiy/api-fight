require_relative '../../spec_helper'
require 'benchmark'

RSpec.describe 'Fighter' do
  context 'index performance' do
    it 'should be fast' do
      expect(Benchmark.realtime { get 'http://localhost:3000/api/v1/fighters' }).to be < 1
    end
  end
  context 'index response' do
    it 'shuold response JSON' do
      get 'http://localhost:3000/api/v1/fighters'
      expect_json([name: 'John Doe', name: 'Foo Bar', name: 'Sir Gey'])
    end
  end
end
