require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '登録ができる時' do
      it '全必須項目が存在すれば、登録できること' do
        expect(@user).to be_valid
      end
    end

    context '登録ができない時' do
      it 'nicknameが空では登録できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailに@が含まれていない場合登録できないこと' do
        @user.email = 'user123gmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        user2 = FactoryBot.build(:user)
        user2.valid?
        expect(user2.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = '123ab'
        @user.password_confirmation = '123ab'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが半角数字だけで登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end

      it 'passwordが半角英字だけで登録できないこと' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end

      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = '123abc'
        @user.password_confirmation = 'abc123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'surname_kanjiが空では登録できないこと' do
        @user.surname_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname kanji can't be blank")
      end

      it 'surname_kanjiが全角（漢字・ひらがな・カタカナ）でなければ登録できないこと' do
        @user.surname_kanji = 'tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include('Surname kanji is invalid. Input full-width characters.')
      end

      it 'name_kanjiが空では登録できないこと' do
        @user.name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kanji can't be blank")
      end

      it 'name_kanjiが全角（漢字・ひらがな・カタカナ）でなければ登録できないこと' do
        @user.name_kanji = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name kanji is invalid. Input full-width characters.')
      end

      it 'surname_kanaが空では登録できないこと' do
        @user.surname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname kana can't be blank")
      end

      it 'surname_kanaが全角カタカナでなければ登録できないこと' do
        @user.surname_kana = '田中'
        @user.valid?
        expect(@user.errors.full_messages).to include('Surname kana is invalid. Input full-width katakana characters.')
      end

      it 'name_kanaが空では登録できないこと' do
        @user.name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana can't be blank")
      end

      it 'name_kanaが全角カタカナでなければ登録できないこと' do
        @user.name_kana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name kana is invalid. Input full-width katakana characters.')
      end

      it 'birthdayが空では登録できないこと' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
