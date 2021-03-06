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
      it '建物番号が空でも登録できる' do
        @shipping_address_purchase_record.building_number = ''
        @shipping_address_purchase_record.valid?
      end
    end
    context '購入できないとき' do
      it '郵便番号の保存にはハイフンがなければ購入できない' do
        @shipping_address_purchase_record.postal_code = '1234567'
        @shipping_address_purchase_record.valid?
        expect(@shipping_address_purchase_record.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '郵便番号が空では購入できない' do
        @shipping_address_purchase_record.postal_code = ''
        @shipping_address_purchase_record.valid?
        expect(@shipping_address_purchase_record.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県(prefecture_id)が１の場合は購入できない' do
        @shipping_address_purchase_record.prefecture_id = 1
        @shipping_address_purchase_record.valid?
        expect(@shipping_address_purchase_record.errors.full_messages).to include("Prefecture must be greater than or equal to 2")
      end
      it '市町村が空では購入できない' do
        @shipping_address_purchase_record.municipality = ''
        @shipping_address_purchase_record.valid?
        expect(@shipping_address_purchase_record.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空では登録できない' do
        @shipping_address_purchase_record.address = ''
        @shipping_address_purchase_record.valid?
        expect(@shipping_address_purchase_record.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号は10桁、または11桁の数値でなければ購入できない' do
        @shipping_address_purchase_record.tel = '123'
        @shipping_address_purchase_record.valid?
        expect(@shipping_address_purchase_record.errors.full_messages).to include('Tel is invalid')
      end
      it '電話番号が空では登録できない' do
        @shipping_address_purchase_record.tel = ''
        @shipping_address_purchase_record.valid?
        expect(@shipping_address_purchase_record.errors.full_messages).to include("Tel can't be blank")
      end
      it '電話番号が英数字混合では登録できない。' do
        @shipping_address_purchase_record.tel = 'test123'
        @shipping_address_purchase_record.valid?
        expect(@shipping_address_purchase_record.errors.full_messages).to include("Tel is invalid")
      end
      it 'tokenが空では登録できない' do
        @shipping_address_purchase_record.token = nil
        @shipping_address_purchase_record.valid?
        expect(@shipping_address_purchase_record.errors.full_messages).to include("Token can't be blank")
      end
      it "user_idがなければ登録できないこと" do
        @shipping_address_purchase_record.user_id = nil
        @shipping_address_purchase_record.valid?
        expect(@shipping_address_purchase_record.errors.full_messages).to include("User can't be blank")
      end
      it "item_idがなければ登録できないこと" do
        @shipping_address_purchase_record.item_id = nil
        @shipping_address_purchase_record.valid?
        expect(@shipping_address_purchase_record.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
