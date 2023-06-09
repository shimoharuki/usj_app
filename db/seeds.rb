# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
6.times do |i|
  Board.create!(
    title: "ボード#{i + 1}",
    body: "ボード#{i + 1}の内容",
    tag_list: 'test',
    user_id: 1  # ユーザーIDを適切な値に変更する
  )

  Board.create!(
    title: "ボードアトラク#{i + 1}",
    body: "ボード#{i + 1}の内容",
    tag_list: 'atraction',
    user_id: 1  # ユーザーIDを適切な値に変更する
  )

  Board.create!(
    title: "ボードご飯#{i + 1}",
    body: "ボード#{i + 1}の内容",
    tag_list: 'food',
    user_id: 1  # ユーザーIDを適切な値に変更する
  )

  Board.create!(
    title: "ボード写真#{i + 1}",
    body: "ボード#{i + 1}の内容",
    tag_list: 'picture',
    user_id: 1  # ユーザーIDを適切な値に変更する
  )

  Board.create!(
    title: "ボード家族#{i + 1}",
    body: "ボード#{i + 1}の内容",
    tag_list: 'family',
    user_id: 1  # ユーザーIDを適切な値に変更する
  )

  Board.create!(
    title: "ボード友達#{i + 1}",
    body: "ボード#{i + 1}の内容",
    tag_list: 'friend',
    user_id: 1  # ユーザーIDを適切な値に変更する
  )

  Board.create!(
    title: "ボード恋人#{i + 1}",
    body: "ボード#{i + 1}の内容",
    tag_list: 'lover',
    user_id: 1  # ユーザーIDを適切な値に変更する
  )

  Board.create!(
    title: "ボードその他#{i + 1}",
    body: "ボード#{i + 1}の内容",
    tag_list: 'other',
    user_id: 1  # ユーザーIDを適切な値に変更する
  )

  Board.create!(
    title: "ボードニンテンド#{i + 1}",
    body: "ボード#{i + 1}の内容",
    tag_list: 'SNW',
    user_id: 1  # ユーザーIDを適切な値に変更する
  )

  Board.create!(
    title: "ボードジョーズ#{i + 1}",
    body: "ボード#{i + 1}の内容",
    tag_list: 'JAWS',
    user_id: 1  # ユーザーIDを適切な値に変更する
  )

  Board.create!(
    title: "ボードワンダー#{i + 1}",
    body: "ボード#{i + 1}の内容",
    tag_list: 'WR',
    user_id: 1  # ユーザーIDを適切な値に変更する
  )

  Board.create!(
    title: "ボードジュラシック#{i + 1}",
    body: "ボード#{i + 1}の内容",
    tag_list: 'JP',
    user_id: 1  # ユーザーIDを適切な値に変更する
  )

  Board.create!(
    title: "ボードミニオン#{i + 1}",
    body: "ボード#{i + 1}の内容",
    tag_list: 'MNR',
    user_id: 1  # ユーザーIDを適切な値に変更する
  )

  Board.create!(
    title: "ボードハリー#{i + 1}",
    body: "ボード#{i + 1}の内容",
    tag_list: 'HP',
    user_id: 1  # ユーザーIDを適切な値に変更する
  )

  Board.create!(
    title: "ボードエリア#{i + 1}",
    body: "ボード#{i + 1}の内容",
    tag_list: 'other_area',
    user_id: 1  # ユーザーIDを適切な値に変更する
  )
  Board.create!(
    title: "ボードエリア#{i + 1}",
    body: "ボード#{i + 1}の内容",
    tag_list: 'randam',
    user_id: 1  # ユーザーIDを適切な値に変更する
  )
end
