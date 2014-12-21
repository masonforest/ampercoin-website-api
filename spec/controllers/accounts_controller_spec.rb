require 'rails_helper'

describe AccountsController, type: :controller do
  describe 'POST /accounts' do
    it 'saves the account' do
      post :create, account: { public_key: :abc }

      expect(json['account']['public_key']).to eq('abc')
    end
  end
end
