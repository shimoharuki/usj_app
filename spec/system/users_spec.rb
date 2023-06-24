require 'rails_helper'
RSpec.describe 'ユーザー登録', type: :system do
  let(:question) { Question.new(question_text: 'どのようにUSJを楽しみたいですか。') }
  let(:choice) { Choice.new(question: question) }
  
  before do
    question.save
    choice.save
  end
  it '正しい情報でユーザーを登録できること' do
    visit new_user_path

    fill_in 'user[name]' , with: 'test'
    fill_in 'user[email]', with: 'test@example.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'


    expect {
      click_button '登録'
      follow_redirect!
    }.to change(User, :count).by(1)
  
    expect(current_path).to eq new_answer_path(question_id: @question.id, choice_id: @choice.id)
  end

  it '無効な情報でエラーメッセージが表示されること' do
    visit new_user_path

    fill_in 'user[name]' , with: 'test'
    fill_in 'user[email]', with: 'test@example.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'dificult'

    click_button '登録'

    expect(page).to have_content '失敗しました'
  end
end