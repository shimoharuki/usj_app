require 'rails_helper'
RSpec.describe 'ユーザー登録', type: :system do
  it '正しい情報でユーザーを登録できること' do
    @user = FactoryBot.create(:user)
    @question = FactoryBot.create(:question)
    @choice = FactoryBot.create(:choice)
    visit new_user_path

    fill_in 'user[name]', with: 'test'
    fill_in 'user[email]', with: 'test@example.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_button '登録'

    expect(page).to have_current_path(new_answer_path)
  end

  it '無効な情報でエラーメッセージが表示されること' do
    visit new_user_path

    fill_in 'user[name]', with: 'test'
    fill_in 'user[email]', with: 'test@example.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'dificult'

    click_button '登録'

    expect(page).to have_content '失敗しました'
  end
end
RSpec.describe 'ユーザーログイン', type: :system do
  # ログイン機能が成功する
  it 'ログイン機能が成功すること' do
    @user = FactoryBot.create(:user)
    visit login_path

    fill_in 'email', with: 'test_user@t.com'
    fill_in 'password', with: 'password'
    click_button 'ログイン'

    expect(page).to have_content 'ログインしました'
  end
  # ログイン機能が失敗する(emailが違う)
  it 'emailが違うことによりログインが失敗する' do
    @user = FactoryBot.create(:user)
    visit login_path

    fill_in 'email', with: 'not_test_user@t.com'
    fill_in 'password', with: 'password'
    click_button 'ログイン'

    expect(page).to have_content 'ログインできませんでした'
  end
  # ログイン機能が失敗する(パスワードが違う)
  it 'パスワードが違うことによりログインが失敗する' do
    @user = FactoryBot.create(:user)
    visit login_path

    fill_in 'email', with: 'test_user@t.com'
    fill_in 'password', with: 'not_password'
    click_button 'ログイン'

    expect(page).to have_content 'ログインできませんでした'
  end
end
RSpec.describe '管理者ログイン', type: :system do
  # 管理者ユーザーがログインで成功
  it '管理者ユーザーのログイン機能が成功すること' do
    @user = FactoryBot.create(:user)
    visit admin_login_path

    fill_in 'email', with: 'test_user@t.com'
    fill_in 'password', with: 'password'
    click_button 'ログイン'

    expect(page).to have_current_path(admin_root_path)
  end
  # 管理者ユーザーがログインで失敗(email)
  it '管理者ユーザーのログイン機能が失敗すること(email)' do
    @user = FactoryBot.create(:user)
    visit admin_login_path

    fill_in 'email', with: 'not_test_user@t.com'
    fill_in 'password', with: 'password'
    click_button 'ログイン'

    expect(page).to have_content 'ログインに失敗しました'
  end
  # 管理者ユーザーがログインで失敗(パスワード)
  it '管理者ユーザーのログイン機能が失敗すること(パスワード)' do
    @user = FactoryBot.create(:user)
    visit admin_login_path

    fill_in 'email', with: 'test_user@t.com'
    fill_in 'password', with: 'not_password'
    click_button 'ログイン'

    expect(page).to have_content 'ログインに失敗しました'
  end
  # ユーザーがログインで失敗(権限)
  it '管理者ユーザーのログイン機能が成功すること' do
    @user = FactoryBot.create(:user, role: 'general')
    visit admin_login_path

    fill_in 'email', with: 'test_user@t.com'
    fill_in 'password', with: 'password'
    click_button 'ログイン'

    expect(page).to have_current_path(main_index_path)
  end
end
