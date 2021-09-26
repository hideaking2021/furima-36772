require 'rails_helper'

RSpec.describe Order, type: :model do

    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_delivery = FactoryBot.build(:order_delivery, user_id: @user.id, item_id: @item.id)
      sleep(1)
    end

  describe '購入情報の保存' do
    context '購入情報が保存できる場合' do
      it 'すべての値が正しく入力されていれば購入ができること' do
        expect(@order_delivery).to be_valid
      end


      it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能' do
        @order_delivery.phone = '09012345678'
        expect(@order_delivery).to be_valid
      end

      it 'buildingが空でも購入できる' do
        @order_delivery.building = ''
        expect(@order_delivery).to be_valid
      end

    end


    context '購入情報が保存できない場合' do
      it 'クレジットカードが空だと保存できない' do
        @order_delivery.token = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Token can't be blank")
      end


      it '郵便番号が空だと保存できない' do
        @order_delivery.postal_code = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号がハイフンがないと保存できない' do
        @order_delivery.postal_code = '1234567'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Postal code is invalid")
      end
    

      it '都道府県が空だと保存できない' do
        @order_delivery.area_id = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Area can't be blank", "Area is not a number")
      end
      it '都道府県--だと保存できない' do
        @order_delivery.area_id = 1
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Area must be other than 1")
      end


      it '市区町村が空だと保存できない' do
        @order_delivery.city = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("City can't be blank")
      end


      it '番地が空だと保存できない' do
        @order_delivery.address = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Address can't be blank")
      end


      it '電話番号が空だと保存できない' do
        @order_delivery.phone = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone can't be blank")
      end
      it '電話番号が9桁以下では購入できない' do
        @order_delivery.phone = '123456789'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone is invalid")
      end
      it '電話番号が12桁以上では購入できない' do
        @order_delivery.phone = '123456789098'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone is invalid")
      end


      it 'user_idが空だと購入できない' do
        @order_delivery.user_id = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("User can't be blank")
      end


      it 'item_idが空だと購入できない' do
        @order_delivery.item_id = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Item can't be blank")
      end

  end
end
end