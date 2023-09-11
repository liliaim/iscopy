require 'rails_helper'

RSpec.describe Spot, type: :model do
  before do
    @spot = FactoryBot.build(:spot)
  end
  describe 'スポット登録' do
    context 'スポット登録できる場合' do
      it '全ての項目の値が存在すれば作成できる' do
        expect(@spot).to be_valid
      end
      it 'informationは空でも保存できること' do
        @spot.information = ''
        expect(@spot).to be_valid
      end
      it 'addressは空でも保存できること' do
        @spot.address = ''
        expect(@spot).to be_valid
      end
      it 'latitudeは空でも保存できること' do
        @spot.latitude = ''
        expect(@spot).to be_valid
      end
      it 'longitudeは空でも保存できること' do
        @spot.longitude = ''
        expect(@spot).to be_valid
      end

    end
    context 'スポット登録できない場合' do
      it 'icon_idが空では作成できない' do
        @spot.icon_id = ''
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Icon can't be blank")
      end
      it 'icon_idが「---」では作成できない' do
        @spot.icon_id = 0
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Icon can't be blank")
      end
      it 'spot_nameが空では作成できない' do
        @spot.spot_name = ''
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Spot name can't be blank")
      end
      it 'prefecture_idが空では作成できない' do
        @spot.prefecture_id = ''
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが「---」では作成できない' do
        @spot.prefecture_id = 0
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @spot.user = nil
        @spot.valid?
        expect(@spot.errors.full_messages).to include("User must exist")
      end
    end
  end
end
