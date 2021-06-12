require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録できるとき' do
      it '全ての値が正しく入力されていれば保存できること' do
      end
      it 'nickname入力されていれば登録できること' do
      end
      it 'passwordとpassword_confirmationが半角英数字が含まれていて6文字以上であれば登録できること' do
      end
      it 'last_nameがひらがな、カタカナ、漢字であれば登録できること' do
      end
      it 'first_nameがひらがな、カタカナ、漢字であれば登録できること' do
      end
      it 'last_name_kanaがカタカナであれば登録できること' do
      end
      it 'first_name_kanaがカタカナであれば登録できること' do
      end
      it 'birthdayが入力されていれば登録できること' do
      end
    end

    context '新規登録できない時' do
      it 'nicknameが空では登録できない' do
      end
      it 'emailが空では登録できない' do
      end
      it '重複したemailが存在する場合は登録できない' do
      end
      it 'emailに@がないと登録できない' do
      end
      it 'passwordが空では登録できない' do
      end
      it 'passwordに半角英数字が含まれていないと登録できない' do
      end
      it 'passwordが5文字以下では登録できない' do
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      end
      it 'passwordとpassword_confirmationが異なる場合は登録できない' do
      end
      it 'last_nameが空では登録できない' do
      end
      it 'last_nameがひらがな、カタカナ、漢字ではない場合登録できない' do
      end
      it 'first_nameが空では登録できない' do
      end
      it 'first_nameがひらがな、カタカナ、漢字ではない場合登録できない' do
      end
      it 'last_name_kanaが空では登録できない' do
      end
      it 'last_name_kanaがカタカナではない場合登録できない' do
      end
      it 'first_name_kanaが空では登録できない' do
      end
      it 'first_name_kanaがカタカナでない場合登録できない' do
      end
      it 'birthdayでは登録できない' do
      end
    end
  end
end