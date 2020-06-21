FactoryBot.define do
  factory :post do
    user_id {"1"}
    body {"test"}
    place_name {"test"}
    difficult {"1"}
    association :user
  end
end
