require 'rails_helper'

RSpec.describe Plan, type: :model do
  before do
    @plan = FactoryBot.build(:plan)
  end
  describe '計画登録' do
    context '計画登録できる場合' do
      it '全ての項目の値が存在すれば作成できる' do
        expect(@plan).to be_valid
      end
      it 'cityは空でも保存できること' do
        @plan.city = ''
        expect(@plan).to be_valid
      end
      it 'start_dateは空でも保存できること' do
        @plan.start_date = ''
        expect(@plan).to be_valid
      end
      it 'end_dateは空でも保存できること' do
        @plan.end_date = ''
        expect(@plan).to be_valid
      end

    end
    context '計画登録できない場合' do
      it 'destinationが空では作成できない' do
        @plan.destination = ''
        @plan.valid?
        expect(@plan.errors.full_messages).to include("Destination can't be blank")
      end
      it 'textが空では作成できない' do
        @plan.text = ''
        @plan.valid?
        expect(@plan.errors.full_messages).to include("Text can't be blank")
      end
      it 'prefecture_idが空では作成できない' do
        @plan.prefecture_id = ''
        @plan.valid?
        expect(@plan.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが「---」では作成できない' do
        @plan.prefecture_id = 0
        @plan.valid?
        expect(@plan.errors.full_messages).to include("Prefecture can't be blank")
      end
      # it 'cityが空では作成できない' do
      #   @plan.text = ''
      #   @plan.valid?
      #   expect(@plan.errors.full_messages).to include("")
      # end
      # it 'start_dateが空では作成できない' do
      #   @plan.start_date = ''
      #   @plan.valid?
      #   expect(@plan.errors.full_messages).to include("")
      # end
      # it 'end_dateが空では作成できない' do
      #   @plan.end_date = ''
      #   @plan.valid?
      #   expect(@plan.errors.full_messages).to include("")
      # end
      it 'end_dateがstart_dateより前では作成できない' do
        @plan.start_date = '2023/12/1'
        @plan.end_date = '2023/11/28'
        @plan.valid?
        expect(@plan.errors.full_messages).to include("End date は開始日より前の日を設定することはできません。")
      end
      it 'userが紐付いていないと保存できない' do
        @plan.user = nil
        @plan.valid?
        expect(@plan.errors.full_messages).to include("User must exist")
      end
    end
  end
end
