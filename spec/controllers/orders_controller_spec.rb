require 'rails_helper'

describe OrdersController, type: :controller do
  it 'returns a new bitcoin address' do
    stub_blockchain
    post :create, order: { address: :test }

    expect(json['order']['payment_address']).to eq('1LrajjY5YcJhdSzepqQNdshrLsqBekN7CF')

  end

  def stub_blockchain
    stub_request(:post, "https://blockchain.info/api/receive").
      to_return(
        status: 200,
        body: {
          input_address: "1LrajjY5YcJhdSzepqQNdshrLsqBekN7CF",
          destination: "1EmkNFuCq26cSFdqFkeDsBTyfPX8RxDvkt",
          fee_percent: 0
        }.to_json, :headers => {})
  end
end
