require 'rails_helper'

describe Brand do
  describe '#new' do
    

    # 空欄かどうか
    it "ブランドネームなしでは無効" do
      brand = FactoryBot.build(:brand, brandname: "")
      brand.valid?
      expect(brand.errors[:brandname]).to include("can't be blank")
    end
  end
end