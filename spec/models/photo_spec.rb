require 'rails_helper'

describe Photo do
  describe '#new' do
    

    # 空欄かどうか
    it "画像なしでは無効" do
      photo = FactoryBot.build(:photo, image: "")
      photo.valid?
      expect(photo.errors[:image]).to include("can't be blank")
    end
  end
  
end