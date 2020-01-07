FactoryBot.define do

  factory :photo do

    sequence(:item_id, 1)
    image    {"123456"}
  end

end