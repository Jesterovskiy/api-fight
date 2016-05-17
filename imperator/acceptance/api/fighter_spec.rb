require_relative '../../spec_helper'
require 'benchmark'

RSpec.describe 'Fighter' do
  context 'index performance' do
    it 'should be fast' do
      expect(Benchmark.realtime { get 'http://localhost:3000/api/v1/fighters' }).to be < 1.5
    end
  end
  context 'index response' do
    it 'should response JSON' do
      get 'http://localhost:3000/api/v1/fighters'
      expect_json([{ id: 1, name: 'Foo Bar' }, { id: 2, name: 'John Doe' }, { id: 3, name: 'Sir Gey' }])
    end
  end
  context 'show response' do
    it 'should response JSON' do
      get 'http://localhost:3000/api/v1/fighters/1'
      expect_json(name: 'Foo Bar', lvl: 80, race: 'cyberman', klass: 'warrior', wins: 5)
    end
  end
  context 'create request' do
    it 'should post JSON data' do
      headers = { "HTTP_CONTENT_TYPE" => "application/json" }
      request = { fighter: {name: 'New Fighter', lvl: 1, race: 'human', klass: 'wizard', wins: 0 }}
      post 'http://localhost:3000/api/v1/fighters', request, headers
      expect_json(name: 'New Fighter', lvl: 1, race: 'human', klass: 'wizard', wins: 0)
    end
  end
end
