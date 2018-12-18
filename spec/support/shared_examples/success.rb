# frozen_string_literal: true
shared_examples_for 'success' do |verb, action, params = {}|
  before { send verb, action, params: params, format: :json }

  it 'returns a success response' do
    expect(response).to have_http_status(:success)
  end
end
