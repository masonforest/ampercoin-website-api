require 'rails_helper'

describe OrdersController, type: :controller do
  it 'returns a new bitcoin address' do
    #stub_blockchain("1LrajjY5YcJhdSzepqQNdshrLsqBekN7CF")
    stub_coinbase("1LrajjY5YcJhdSzepqQNdshrLsqBekN7CF")

    post :create, order: { address: :test }

    expect(json['order']['payment_address']).to eq('1LrajjY5YcJhdSzepqQNdshrLsqBekN7CF')

  end

end
