require_relative '../../../../apps/api/controllers/fighters/index'

RSpec.describe Api::Controllers::Fighters::Index do
  let(:action) { described_class.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end
end
