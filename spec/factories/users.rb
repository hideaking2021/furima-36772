FactoryBot.define do
  factory :user do
    nickname               {"ニックネーム"}
    email                  {Faker::Internet.email}
    password               {"a000000"}
    password_confirmation  {password}
    last_name              {"山田"}
    first_name             {"太郎"}          
    last_name_kana         {"ヤマダ"}
    first_name_kana        {"タロウ"}
    birthday               {"2021-01-01"}    
  end
end
