require 'rails_helper'

describe PaymentsController, :type => :controller do
  describe 'POST /purchases' do
    it 'alerts all he clients' do
      #stub_blockchain("1LrajjY5YcJhdSzepqQNdshrLsqBekN7CF")
      order = create(:order)
      stub_request(:post, "#{ENV['AMPERCOIN_NODE']}/aaccounts")
      stub_coinbase("1LrajjY5YcJhdSzepqQNdshrLsqBekN7CF")


      allow(Pusher).to receive(:trigger)

      get :create, payment_params(order)

      order.reload
      expect(order).to be_paid
      expect(Pusher).to have_received(:trigger).with(:payments, :paid, {order_id: order.id})
      expect(a_request(:post, "#{ENV['AMPERCOIN_NODE']}/accounts")).to have_been_made
    end
  end
end

def payment_params(order)
  {
    "address" => "1GHqsQ1Vb92wzFje5fZjkhYY4geyYu9fDi",
      "amount" => 0.02003489,
"transaction" => {
            "id" => "548e5b8d6ea8fd2855004008",
    "created_at" => "2014-12-14T19:54:53-08:00",
          "hash" => "e440d6158e9cef51c0fe340d26dcaf028bd0bc9575fc16ead9e12aff430bae19"
},
    "order_id" => order.id,
    "payment" => {
        "address" => "1GHqsQ1Vb92wzFje5fZjkhYY4geyYu9fDi",
          "amount" => 0.02003489,
    "transaction" => {
                "id" => "548e5b8d6ea8fd2855004008",
        "created_at" => "2014-12-14T19:54:53-08:00",
              "hash" => "e440d6158e9cef51c0fe340d26dcaf028bd0bc9575fc16ead9e12aff430bae19"
    }
  }
}
end

def blockchain_info_payment_params(order)
  {
    order_id: order.id,
    input_transaction_hash: "ebbcf48310241cd8499f7248bb413ec908dd668cd0c5cb84a296b12b339d242d",
    shared: false,
    address: "1EmkNFuCq26cSFdqFkeDsBTyfPX8RxDvkt",
    destination_address: "1EmkNFuCq26cSFdqFkeDsBTyfPX8RxDvkt",
    input_address: "13maJTQ2KZGLoaWWGfuHpeoKWtqJ2xG2pt",
    anonymous: false,
    confirmations: 0,
    value: 2002212,
    transaction_hash:"76daf2c75f10e3ee549d04a54294114cc8844eed39b3faef243fbf103e35d526"
  }
end
