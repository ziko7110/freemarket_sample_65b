FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    family_name_kanji     {"山田"}
    first_name_kanji      {"彩"}
    family_name_kana       {"ヤマダ"}
    first_name_kana       {"アヤ"}
    birth_year            {1999}
    birth_month           {6}
    birth_day             {6}
    mobile_phone_number   {"00000000000"}
    postal_code           {"0000000"}
    prefecture             {"北海道"}
    city                  {"札幌市"}  
    address_number         {"1-1"}
    building_name           {"鬼ビル"}
  end

end