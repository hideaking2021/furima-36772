FactoryBot.define do
  factory :order_delivery do
  
    postal_code {'123-4567'}
    area_id {3}
    city {'大阪'}
    address {'1-1'}
    building {'ハルカス'}
    phone {'09012345678'}
    token { 'sk_test_000000000000000000000000' }
    
    end
  end

  