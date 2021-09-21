require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品が出品できる場合' do
      it '全て入力していれば登録できる' do
        expect(@item).to be_valid
      end 
      
      it '価格は、¥300以上なら保存可能であること' do
        @item.price = '300'
        expect(@item).to be_valid
      end

      it '価格は、¥9,999,999以下なら保存可能であること' do
        @item.price = '9999999'
        expect(@item).to be_valid
      end

      it '価格は、半角英数のみ保存可能であること' do
        @item.price = '12345'
        expect(@item).to be_valid
      end
    end


    context '商品が出品できない場合' do
      it '画像が空では登録できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明が空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      
      it 'カテゴリーが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it 'カテゴリーが--は登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it '商品の状態が空では登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition is not a number")
      end
      it '商品の状態が--は登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end

      it '配送料が空では登録できない' do
        @item.fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee is not a number")
      end
      it '配送料が--は登録できない' do
        @item.fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee must be other than 1")
      end

      it '発送元の地域が空では登録できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Area is not a number")
      end
      it '発送元の地域が--は登録できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 1")
      end

      it '発送までの日数が空では登録できない' do
        @item.shopping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping day is not a number")
      end
      it '発送までの日数が--は登録できない' do
        @item.shopping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping day must be other than 1")
      end

      it '価格は300円未満なら保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end

      it '価格は10000000円以上なら保存できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end

      it '価格は半角英語では保存できない' do
        @item.price = 'abcdefg'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end

      it '価格は半角英語では保存できない' do
        @item.price = 'abcdefg'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end

      it '価格は全角数字では保存できない' do
        @item.price = '１２３４５６７'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end

      it '価格は全角英語では保存できない' do
        @item.price = 'ABCDEFG'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end

    end
  end


end



