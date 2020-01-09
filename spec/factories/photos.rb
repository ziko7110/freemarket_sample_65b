FactoryBot.define do

  factory :photo do
    sequence(:id, 1)
    sequence(:item_id, 1)
    image    {"123456"}
  end

end