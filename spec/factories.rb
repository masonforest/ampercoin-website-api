FactoryGirl.define do
  factory :preordered_account do
    sequence :address do |n|
      "user#{n}"
    end

    trait :paid do
      after(:create) do |account, evaluator|
        create(:order, :paid, account: account)
      end
    end
  end

  factory :order do
    preordered_account

    trait :paid do
      payment_transaction "XXX"
    end
  end
end
