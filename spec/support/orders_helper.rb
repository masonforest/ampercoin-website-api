def stub_blockchain(input_adress)
  stub_request(:post, "https://blockchain.info/api/receive").
    to_return(
      status: 200,
      body: {
        input_address: input_adress,
        destination: "1EmkNFuCq26cSFdqFkeDsBTyfPX8RxDvkt",
        fee_percent: 0
      }.to_json, :headers => {})
end

def stub_coinbase(input_adress)
  stub_request(:post, "https://coinbase.com/api/v1/account/generate_receive_address").
    to_return do |request|
      {
        status: 200,
        body: {
          success: true,
          address: input_adress,
          callback_url: JSON.parse(request.body)['address']['callback_url']
        }.to_json
      }
    end
end
