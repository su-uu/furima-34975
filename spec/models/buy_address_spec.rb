require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  describe '商品商品購入' do
    before do
      user = FactoryBot.create(:user)
      product = FactoryBot.build(:product)
      product.image = fixture_file_upload('app/assets/images/furima-logo-color.png')
      product.save
      @buy_address = FactoryBot.build(:buy_address, user_id: user.id, product_id: product.id)
      sleep 0.1
    end

    context '商品購入ができるとき' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@buy_address).to be_valid
      end
      it 'tokenが入力されていれば保存できること' do
        @buy_address.token = 'tok_abcdefghijk12345678901234567'
        expect(@buy_address).to be_valid
      end
      it 'postal_codeが半角数字で3桁 - 4桁入力されていれば保存できること' do
        @buy_address.postal_code = '000-0000'
        expect(@buy_address).to be_valid
      end
      it 'prefectures_idが1以上（--- 以外）であれば保存できること' do
        @buy_address.prefecture_id = 2
        expect(@buy_address).to be_valid
      end
      it 'cityが入力されていれば保存できること' do
        @buy_address.city = '旭川市'
        expect(@buy_address).to be_valid
      end
      it 'streetが入力されていれば保存できること' do
        @buy_address.street = '神居1-1'
        expect(@buy_address).to be_valid
      end
      it 'buildingが入力されていても保存できること' do
        @buy_address.building = 'アパート名101'
        expect(@buy_address).to be_valid
      end
      it 'buildingは空白でも保存できること' do
        @buy_address.building = ''
        expect(@buy_address).to be_valid
      end
      it 'telが入力されていれば保存できること' do
        @buy_address.tel = '09001234567'
        expect(@buy_address).to be_valid
      end
      it 'telが半角数字で10桁入力されていれば保存できること' do
        @buy_address.tel = '0123456789'
        expect(@buy_address).to be_valid
      end
      it 'telが半角数字で11桁入力されていれば保存できること' do
        @buy_address.tel = '01234567891'
        expect(@buy_address).to be_valid
      end
    end

    context '商品購入ができないとき' do
      it 'tokenが存在しないと保存できないこと' do
        @buy_address.token = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが存在しないと保存できないこと' do
        @buy_address.postal_code = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeは -(ハイフン) が存在しないと保存できないこと' do
        @buy_address.postal_code = '1234567'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'postal_codeは全角数字では保存できないこと' do
        @buy_address.postal_code = '０１２-３４５６'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'postal_codeは 半角数字でハイフンが存在していても(3桁 - 4桁)以外では保存できないこと' do
        @buy_address.postal_code = '12-34'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'prefecture_idが1（---）だと保存できないこと' do
        @buy_address.prefecture_id = 1
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが存在しないと保存できないこと' do
        @buy_address.city = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("City can't be blank")
      end
      it 'streetが存在しないと保存できないこと' do
        @buy_address.street = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Street can't be blank")
      end
      it 'telが存在しないと保存できないこと' do
        @buy_address.tel = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Tel can't be blank")
      end
      it 'telが10桁以下では保存できないこと' do
        @buy_address.tel = '012345678'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Tel is too short')
      end
      it 'telが全角数字では保存できないこと' do
        @buy_address.tel = '０１２３４５６７８９'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Tel is invalid. Input only number')
      end
      it 'userが紐付いていないと保存できないこと' do
        @buy_address.user_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("User can't be blank")
      end
      it 'productが紐付いていないと保存できないこと' do
        @buy_address.product_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Product can't be blank")
      end
    end
  end
end
