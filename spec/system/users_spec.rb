require 'rails_helper'

RSpec.describe 'ユーザー登録', type: :system do
  it '正しい情報でユーザーを登録できること' do
    visit new_user_path

    fill_in 'ユーザー名', with: 'test'
    fill_in 'メールアドレス', with: 'test@example.com'
    fill_in 'パスワード', with: 'password'
    fill_in 'パスワード確認', with: 'password'

    click_button '登録'

    expect(page).to have_content 'ようこそ！登録が完了しました。'
  end

  it '無効な情報でエラーメッセージが表示されること' do
    visit new_user_path

    fill_in 'ユーザー名', with: 'test'
    fill_in 'メールアドレス', with: 'test@example.com'
    fill_in 'パスワード', with: 'password'
    fill_in 'パスワード確認', with: 'incorrect'

    click_button '登録'

    expect(page).to have_content 'パスワード確認がパスワードと一致しません'
  end
end