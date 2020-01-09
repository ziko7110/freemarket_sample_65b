FactoryBot.define do
  
  factory :item do
    name              {"abc"}
    price             {"100000"}
    description       {"aaaaaa"}
    condition          {0}
    delivery_fee      {0}
    shipping_area     {0}
    shipping_days     {0}
    categoryname      {0}
    after(:build) do |item|
    item.brand = build(:brand)
    # item.photos = build(:photo)
    # brand
    # after(:build) do |item|
    
      # ここでitemに紐づいたbrand、photoをcreateする
      # item.user = build(:user)
      # item.user = User.create()
    end
  end
end
  