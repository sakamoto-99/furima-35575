require 'rails_helper'
RSpec.describe ShippingAddressPurchaseRecord, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:user)
    @shipping_address_purchase_record = FactoryBot.build(:shipping_address_purchase_record, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context '商品を購入できるとき' do
      it '全ての情報を正しく入力すれば購入できる' do
        expect(@shipping_address_purchase_record).to be_valid
      end
    end
    context '購入できないとき' do
      it '郵便番号の保存にはハイフンがなければ購入できない' do
        @shipping_address_purchase_record.postal_code = '1234567'
        @shipping_address_purchase_record.valid?
        expect(@shipping_address_purchase_record.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '電話番号は11桁以内の数値でなければ購入できない' do
        @shipping_address_purchase_record.tel = '123'
        @shipping_address_purchase_record.valid?
        expect(@shipping_address_purchase_record.errors.full_messages).to include('Tel is invalid')
      end
      it 'tokenが空では登録できない' do
        @shipping_address_purchase_record.token = nil
        @shipping_address_purchase_record.valid?
        expect(@shipping_address_purchase_record.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
