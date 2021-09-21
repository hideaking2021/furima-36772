FactoryBot.define do
  factory :item do
    name                 {"写真"}
    description          {"綺麗な空間"}
    category_id          {3}
    condition_id         {3}
    fee_id               {3}
    area_id              {3}
    shopping_day_id      {3}
    price                {10000}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
