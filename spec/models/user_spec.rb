require 'rails_helper'

describe User do
  describe '#create' do



  # 空欄かどうか
    it "ニックネームなしでは無効" do
      user = FactoryBot.build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "パスワードなしでは無効" do
      user = FactoryBot.build(:user, encrypted_password: "")
      user.valid?
      expect(user.errors[:encrypted_password]).to include("can't be blank")
    end

    it "メールアドレスなしでは無効" do
      user = FactoryBot.build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    it "名字（漢字）なしでは無効" do
      user = FactoryBot.build(:user,family_name_kanji:  "")
      user.valid?
      expect(user.errors[:family_name_kanji]).to include("can't be blank")
    end
    it "名前（漢字）なしでは無効" do
      user = FactoryBot.build(:user,first_name_kanji:  "")
      user.valid?
      expect(user.errors[:first_name_kanji]).to include("can't be blank")
    end
    it "名字（カナ）なしでは無効" do
      user = FactoryBot.build(:user,family_name_kana:  "")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("can't be blank")
    end

    it "名前（カナ）なしでは無効" do
      user = FactoryBot.build(:user,first_name_kana:  "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end

    it "誕生年なしでは無効" do
      user = FactoryBot.build(:user,birth_year:  "")
      user.valid?
      expect(user.errors[:birth_year]).to include("can't be blank")
    end

    it "誕生月なしでは無効" do
      user = FactoryBot.build(:user,birth_month:  "")
      user.valid?
      expect(user.errors[:birth_month]).to include("can't be blank")
    end

    it "誕生日なしでは無効" do
      user = FactoryBot.build(:user,birth_day:  "")
      user.valid?
      expect(user.errors[:birth_day]).to include("can't be blank")
    end
    it "電話番号なしでは無効" do
      user = FactoryBot.build(:user,mobile_phone_number: "")
      user.valid?
      expect(user.errors[:mobile_phone_number]).to include("can't be blank")
    end


    it "名字がカナになっているか " do
      user = build(:user, family_name_kana: "アアアア")
      user.valid?
      expect(user[:family_name_kana]).to include("アアアア")
    end

    it "名前がカナになっているか " do
      user = build(:user, first_name_kana: "アアアア")
      user.valid?
      expect(user[:first_name_kana]).to include("アアアア")
    end


    it "電話番号の形式が正しいか " do
      user = build(:user, mobile_phone_number: "08012345678")
      user.valid?
      expect(user[:mobile_phone_number]).to include("08012345678")
    end
    it "電話番号の形式が正しいか２ " do
      user = build(:user, mobile_phone_number: "a8012345678")
      user.valid?
      expect(user[:mobile_phone_number]).to include("a8012345678")
    end

    it "アドレスが英語か " do
      user = build(:user, email: "aaaあああ")
      user.valid?
      expect(user).not_to be_valid
    end

  end
end
