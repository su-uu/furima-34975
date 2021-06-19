require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '商品出品' do
    before do
      @product = FactoryBot.build(:product)
      @product.image = fixture_file_upload("app/assets/images/furima-logo-color.png")
    end

    context '商品出品ができるとき' do
      it '全ての値が正しく入力されていれば保存できること' do
      end
      it 'imageが存在すれば保存できること' do
      end
      it 'titleが入力されていれば保存できること' do
      end
      it 'describeが入力されていれば保存できること' do
      end
      it 'category_idが1以上（--- 以外）であれば保存できること' do
      end
      it 'status_idが1以上（--- 以外）であれば保存できること' do
      end
      it 'delivery_idが1以上（--- 以外）であれば保存できること' do
      end
      it 'prefectures_idが1以上（--- 以外）であれば保存できること' do
      end
      it 'shipping_date_idが1以上（--- 以外）であれば保存できること' do
      end
      it 'priceが300以上,9999999以下であれば保存できること' do
      end
      it 'priceが半角数字であれば保存できること' do
      end
    end

    context '商品出品ができないとき' do
      it 'imageが存在しないと保存できないこと' do
      end
      it 'titleが空では保存できないこと' do
      end
      it 'describeが空では保存できないこと' do
      end
      it 'category_idが1（---）だと保存できないこと' do
      end
      it 'status_idが1（---）だと保存できないこと' do
      end
      it 'delivery_idが1（---）だと保存できないこと' do
      end
      it 'prefectures_idが1（---）だと保存できないこと' do
      end
      it 'shipping_date_idが1（---）だと保存できないこと' do
      end
      it 'priceが299以下だと保存できないこと' do
      end
      it 'priceが10000000以上だと保存できないこと' do
      end
      it 'priceが全角数字だと保存できないこと' do
      end
    end
  end
end
