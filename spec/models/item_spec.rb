require 'rails_helper'

describe Item do
  describe '#new' do
    

    # 空欄かどうか
    it "ブランドネームなしでは無効" do
      item = FactoryBot.build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end
    it "プライスなしでは無効" do
      item = FactoryBot.build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end
    it "説明文なしでは無効" do
      item = FactoryBot.build(:item, description: "")
      item.valid?
      expect(item.errors[:description]).to include("can't be blank")
    end
    it "商品状態なしでは無効" do
      item = FactoryBot.build(:item, condition: "")
      item.valid?
      expect(item.errors[:condition]).to include("can't be blank")
    end
    it "配送方法なしでは無効" do
      item = FactoryBot.build(:item, delivery_fee: "")
      item.valid?
      expect(item.errors[:delivery_fee]).to include("can't be blank")
    end
    it "配送元地域なしでは無効" do
      item = FactoryBot.build(:item, shipping_area: "")
      item.valid?
      expect(item.errors[:shipping_area]).to include("can't be blank")
    end
    it "配送日数なしでは無効" do
      item = FactoryBot.build(:item, shipping_days: "")
      item.valid?
      expect(item.errors[:shipping_days]).to include("can't be blank")
    end
    it "カテゴリーなしでは無効" do
      item = FactoryBot.build(:item, categoryname: "")
      item.valid?
      expect(item.errors[:categoryname]).to include("can't be blank")
    end
  end
end