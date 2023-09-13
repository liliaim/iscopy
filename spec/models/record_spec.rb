require 'rails_helper'

RSpec.describe Record, type: :model do
  before do
    @record = FactoryBot.build(:record)
  end
  describe '記録登録' do
    context '記録を登録できる場合' do
      it '全ての項目の値が存在すれば作成できる' do
        expect(@record).to be_valid
      end
      it 'cityは空でも保存できること' do
        @record.city = ''
        expect(@record).to be_valid
      end
      it 'start_dateは空でも保存できること' do
        @record.start_date = ''
        expect(@record).to be_valid
      end
      it 'end_dateは空でも保存できること' do
        @record.end_date = ''
        expect(@record).to be_valid
      end
      it 'plan_idは空でも保存できること' do
        @record.plan_id = ''
        expect(@record).to be_valid
      end
      it 'plan_idを登録する場合、指定されたplan_idが存在すれば保存できる' do
        @plan = FactoryBot.build(:plan)
        @plan.save
        @record.plan_id = @plan.id
        expect(@record).to be_valid
      end

    end
    context '記録を登録できない場合' do
      it 'destinationが空では作成できない' do
        @record.destination = ''
        @record.valid?
        expect(@record.errors.full_messages).to include("Destination can't be blank")
      end
      it 'textが空では作成できない' do
        @record.text = ''
        @record.valid?
        expect(@record.errors.full_messages).to include("Text can't be blank")
      end
      it 'prefecture_idが空では作成できない' do
        @record.prefecture_id = ''
        @record.valid?
        expect(@record.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが「---」では作成できない' do
        @record.prefecture_id = 0
        @record.valid?
        expect(@record.errors.full_messages).to include("Prefecture can't be blank")
      end
      # it 'cityが空では作成できない' do
      #   @record.city = ''
      #   @record.valid?
      #   expect(@record.errors.full_messages).to include("")
      # end
      # it 'start_dateが空では作成できない' do
      #   @record.start_date = ''
      #   @record.valid?
      #   expect(@record.errors.full_messages).to include("")
      # end
      # it 'end_dateが空では作成できない' do
      #   @record.end_date = ''
      #   @record.valid?
      #   expect(@record.errors.full_messages).to include("")
      # end
      it 'end_dateがstart_dateより前では作成できない' do
        @record.start_date = '2023/12/1'
        @record.end_date = '2023/11/28'
        @record.valid?
        expect(@record.errors.full_messages).to include("End date は開始日より前の日を設定することはできません。")
      end
      it '指定されたplan_idが存在しないと保存できない' do
        @plan = FactoryBot.build(:plan)
        @plan.save
        @record.plan_id = @plan.id + 1
        @record.valid?
        expect(@record.errors.full_messages).to include("Plan specified plan does not exist")
      end
      it 'userが紐付いていないと保存できない' do
        @record.user = nil
        @record.valid?
        expect(@record.errors.full_messages).to include("User must exist")
      end
    end
  end
end
