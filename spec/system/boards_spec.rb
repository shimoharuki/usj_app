require 'rails_helper'
RSpec.describe '投稿の表示', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  # パークエリア情報の投稿を取得
  it 'パークエリアの投稿を取得できること' do
    @board = FactoryBot.create(:board, tag_list: 'park')

    visit boards_path(tag_name: 'park')
    expect(page).to have_current_path(boards_path(tag_name: 'park'))
    expect(@board.tag_list).to include('park')
  end
  # アトラクション情報の投稿を取得
  it 'アトラクションの投稿を取得できること' do
    @board = FactoryBot.create(:board, tag_list: 'atraction')

    visit boards_path(tag_name: 'atraction')
    expect(page).to have_current_path(boards_path(tag_name: 'atraction'))
    expect(@board.tag_list).to include('atraction')
  end
  # 整理券情報の投稿を取得
  it '整理券の投稿を取得できること' do
    @board = FactoryBot.create(:board, tag_list: 'ticket')

    visit boards_path(tag_name: 'ticket')
    expect(page).to have_current_path(boards_path(tag_name: 'ticket'))
    expect(@board.tag_list).to include('ticket')
  end
  # イベント情報の投稿を取得
  it '整理券の投稿を取得できること' do
    @board = FactoryBot.create(:board, tag_list: 'event')

    visit boards_path(tag_name: 'event')
    expect(page).to have_current_path(boards_path(tag_name: 'event'))
    expect(@board.tag_list).to include('event')
  end
  # 困った時情報の投稿を取得
  it '困った時の投稿を取得できること' do
    @board = FactoryBot.create(:board, tag_list: 'question')

    visit boards_path(tag_name: 'question')
    expect(page).to have_current_path(boards_path(tag_name: 'question'))
    expect(@board.tag_list).to include('question')
  end
  # 入場までの準備情報の投稿を取得
  it '入場までの投稿を取得できること' do
    @board = FactoryBot.create(:board, tag_list: 'preparation')

    visit boards_path(tag_name: 'preparation')
    expect(page).to have_current_path(boards_path(tag_name: 'preparation'))
    expect(@board.tag_list).to include('preparation')
  end
end
