require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品' do
    context '商品を出品できるとき' do
      it '全ての情報を正しく入力すれば出品できる' do
        expect(@product).to be_valid
      end
    end
    context '商品を出品できないとき' do
      it '商品画像を1枚つけなければ出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it 'titleが空では出品できない' do
        @product.title = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Title can't be blank")
      end
      it 'descriptionが空では出品できない' do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが1だと登録できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category must be greater than or equal to 2")
      end
      it 'status_idが1だと登録できない' do
        @product.status_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Status must be greater than or equal to 2")
      end
      it 'delivery_charge_idが1だと登録できない' do
        @product.delivery_charge_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery charge must be greater than or equal to 2")
      end
      it 'prefecture_idが1だと登録できない' do
        @product.prefecture_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture must be greater than or equal to 2")
      end
      it 'day_to_ship_idが1だと登録できない' do
        @product.day_to_ship_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Day to ship must be greater than or equal to 2")
      end
      it 'priceが空では出品できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceは、¥¥9,999,999以上では出品できない' do
        @product.price = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'priceは、¥300以下では出品できない' do
        @product.price = 0
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceは半角数字以外では出品できない' do
        @product.price = 'testABC１２３'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not a number')
      end
      it 'priceは半角英数混合では登録できない' do
        @product.price = 'test100'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not a number')
      end
      it 'priceは半角英語だけでは登録できない' do
        @product.price = 'test'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end