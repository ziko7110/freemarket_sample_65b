FactoryBot.define do

  factory :item do
    sequence(:id, 1)
    name              {"abc"}
    price             {"12345"}
    user_id          {1}
    # buyer_id             {2}
    # seller_id            {1}
    condition         {1}
    delivery_fee      {1}
    delivery_method   {1}
    shipping_area     {1}
    shipping_days     {1}
  end

end