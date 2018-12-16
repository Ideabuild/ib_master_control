# frozen_string_literal: true
shared_examples_for 'access_denied' do |verb, action, params|
  before { send verb, action, params: params, format: :json }

  it 'returns a 401 response' do
    expect(response.status).to eq(401)
  end

  it 'returns an error message' do
    expect(json_response['messages']).to_not be_empty
  end
end
