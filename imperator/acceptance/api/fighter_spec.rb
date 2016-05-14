require_relative '../../spec_helper'
require 'benchmark'

RSpec.describe 'Fighter' do
  context 'index performance' do
    it 'should be fast' do
      Benchmark.realtime{ get 'http://localhost:3000/api/v1/fighter/1' }.should < 0.5
    end
  end
  context 'index response' do
    it 'shuold response JSON' do
      get 'http://localhost:3000/api/v1/fighter/1'
      expect_json(name: 'John Doe')
    end
  end
end
