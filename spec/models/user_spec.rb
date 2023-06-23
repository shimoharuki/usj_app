require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  describe 'ユーザー登録' do
    context '有効なユーザー情報が与えられた場合' do
      it 'ユーザーが正常に登録されること' do
        user = User.new(
          name: 'テストユーザー',
          email: 'test@example.com',
          password: 'password',
          password_confirmation: 'password'
        )
        expect(user).to be_valid
      end
    end

    context '名前が空白の場合' do
      it 'ユーザー登録が失敗すること' do
        user = User.new(name: '', email: 'test@example.com', password: 'password')
        expect(user).not_to be_valid
      end
    end

    context 'メールアドレスが重複している場合' do
      before do
        User.create(name: '既存ユーザー', email: 'test@example.com', password: 'password')
      end

      it 'ユーザー登録が失敗すること' do
        user = User.new(name: '新規ユーザー', email: 'test@example.com', password: 'password')
        expect(user).not_to be_valid
      end
    end

    # 他のテストケースを追加する場合は、同様に記述する
  end
end
