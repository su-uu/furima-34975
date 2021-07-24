require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '商品出品' do
    before do
      @product = FactoryBot.build(:product)
      @product.image = fixture_file_upload('app/assets/images/furima-logo-color.png')
    end

    context '商品出品ができるとき' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@product).to be_valid
      end
      it 'imageが存在すれば保存できること' do
        @product.image = fixture_file_upload('app/assets/images/item-sample.png')
        expect(@product).to be_valid
      end
      it 'titleが入力されていれば保存できること' do
        @product.title = 'a'
        expect(@product).to be_valid
      end
      it 'describeが入力されていれば保存できること' do
        @product.describe = 'a'
        expect(@product).to be_valid
      end
      it 'category_idが1以上（--- 以外）であれば保存できること' do
        @product.category_id = 2
        expect(@product).to be_valid
      end
      it 'status_idが1以上（--- 以外）であれば保存できること' do
        @product.status_id = 2
        expect(@product).to be_valid
      end
      it 'delivery_idが1以上（--- 以外）であれば保存できること' do
        @product.delivery_id = 2
        expect(@product).to be_valid
      end
      it 'prefecture_idが1以上（--- 以外）であれば保存できること' do
        @product.prefecture_id = 2
        expect(@product).to be_valid
      end
      it 'shipping_date_idが1以上（--- 以外）であれば保存できること' do
        @product.shipping_date_id = 2
        expect(@product).to be_valid
      end
      it 'priceが半角数字の300以上,9,999,999以下であれば保存できること' do
        @product.price = 300
        expect(@product).to be_valid
      end
    end

    context '商品出品ができないとき' do
      it 'imageが存在しないと保存できないこと' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it 'titleが空では保存できないこと' do
        @product.title = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Title can't be blank")
      end
      it 'describeが空では保存できないこと' do
        @product.describe = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Describe can't be blank")
      end
      it 'category_idが1（---）だと保存できないこと' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
      it 'status_idが1（---）だと保存できないこと' do
        @product.status_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Status can't be blank")
      end
      it 'delivery_idが1（---）だと保存できないこと' do
        @product.delivery_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery can't be blank")
      end
      it 'prefecture_idが1（---）だと保存できないこと' do
        @product.prefecture_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'shipping_date_idが1（---）だと保存できないこと' do
        @product.shipping_date_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping date can't be blank")
      end
      it 'priceが空だと保存できないこと' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300円未満だと保存できないこと' do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include('Price out of setting range')
      end
      it 'priceが10,000,000円以上だと保存できないこと' do
        @product.price = 10_000_000
        @product.valid?
        expect(@product.errors.full_messages).to include('Price out of setting range')
      end
      it 'priceが全角数字だと保存できないこと' do
        @product.price = '３００'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is invalid. Input half-width characters')
      end
      it 'priceが半角英数字混合では保存できないこと' do
        @product.price = '300yen'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is invalid. Input half-width characters')
      end
      it 'priceが半角英字のみでは保存できないこと' do
        @product.price = 'senyen'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is invalid. Input half-width characters')
      end
      it 'userが紐付いていないと保存できないこと' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('User must exist')
      end
    end
  end
end
