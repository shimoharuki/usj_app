# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_230_612_055_950) do
  create_table 'answer_recommendations', force: :cascade do |t|
    t.integer 'answer_id', null: false
    t.integer 'recommendation_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['answer_id'], name: 'index_answer_recommendations_on_answer_id'
    t.index ['recommendation_id'], name: 'index_answer_recommendations_on_recommendation_id'
  end

  create_table 'answers', force: :cascade do |t|
    t.integer 'question_id'
    t.integer 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'choices'
    t.integer 'choice_id'
    t.index ['choice_id'], name: 'index_answers_on_choice_id'
    t.index ['question_id'], name: 'index_answers_on_question_id'
    t.index ['user_id'], name: 'index_answers_on_user_id'
  end

  create_table 'board_recommendations', force: :cascade do |t|
    t.integer 'board_id', null: false
    t.integer 'recommendation_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['board_id'], name: 'index_board_recommendations_on_board_id'
    t.index ['recommendation_id'], name: 'index_board_recommendations_on_recommendation_id'
  end

  create_table 'boards', force: :cascade do |t|
    t.integer 'user_id'
    t.string 'title'
    t.text 'body'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'recommendation_id'
    t.index ['recommendation_id'], name: 'index_boards_on_recommendation_id'
    t.index ['user_id'], name: 'index_boards_on_user_id'
  end

  create_table 'choices', force: :cascade do |t|
    t.string 'choice_name'
    t.integer 'question_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['question_id'], name: 'index_choices_on_question_id'
  end

  create_table 'likes', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.integer 'board_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['board_id'], name: 'index_likes_on_board_id'
    t.index %w[user_id board_id], name: 'index_likes_on_user_id_and_board_id', unique: true
    t.index ['user_id'], name: 'index_likes_on_user_id'
  end

  create_table 'questions', force: :cascade do |t|
    t.string 'question_text'
    t.integer 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_questions_on_user_id'
  end

  create_table 'recommendations', force: :cascade do |t|
    t.integer 'board_id'
    t.integer 'answer_id'
    t.integer 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['answer_id'], name: 'index_recommendations_on_answer_id'
    t.index ['board_id'], name: 'index_recommendations_on_board_id'
    t.index ['user_id'], name: 'index_recommendations_on_user_id'
  end

  create_table 'taggings', force: :cascade do |t|
    t.integer 'tag_id'
    t.string 'taggable_type'
    t.integer 'taggable_id'
    t.string 'tagger_type'
    t.integer 'tagger_id'
    t.string 'context', limit: 128
    t.datetime 'created_at', precision: nil
    t.string 'tenant', limit: 128
    t.index ['context'], name: 'index_taggings_on_context'
    t.index %w[tag_id taggable_id taggable_type context tagger_id tagger_type], name: 'taggings_idx',
                                                                                unique: true
    t.index ['tag_id'], name: 'index_taggings_on_tag_id'
    t.index %w[taggable_id taggable_type context], name: 'taggings_taggable_context_idx'
    t.index %w[taggable_id taggable_type tagger_id context], name: 'taggings_idy'
    t.index ['taggable_id'], name: 'index_taggings_on_taggable_id'
    t.index %w[taggable_type taggable_id], name: 'index_taggings_on_taggable_type_and_taggable_id'
    t.index ['taggable_type'], name: 'index_taggings_on_taggable_type'
    t.index %w[tagger_id tagger_type], name: 'index_taggings_on_tagger_id_and_tagger_type'
    t.index ['tagger_id'], name: 'index_taggings_on_tagger_id'
    t.index %w[tagger_type tagger_id], name: 'index_taggings_on_tagger_type_and_tagger_id'
    t.index ['tenant'], name: 'index_taggings_on_tenant'
  end

  create_table 'tags', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'taggings_count', default: 0
    t.index ['name'], name: 'index_tags_on_name', unique: true
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', null: false
    t.string 'crypted_password'
    t.string 'salt'
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'role', default: 0, null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_token_expires_at'
    t.datetime 'reset_password_email_sent_at'
    t.integer 'access_count_to_reset_password_page', default: 0
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token'
  end

  add_foreign_key 'answer_recommendations', 'answers'
  add_foreign_key 'answer_recommendations', 'recommendations'
  add_foreign_key 'answers', 'choices'
  add_foreign_key 'answers', 'questions'
  add_foreign_key 'answers', 'users'
  add_foreign_key 'board_recommendations', 'boards'
  add_foreign_key 'board_recommendations', 'recommendations'
  add_foreign_key 'boards', 'recommendations'
  add_foreign_key 'boards', 'users'
  add_foreign_key 'choices', 'questions'
  add_foreign_key 'likes', 'boards'
  add_foreign_key 'likes', 'users'
  add_foreign_key 'questions', 'users'
  add_foreign_key 'recommendations', 'answers'
  add_foreign_key 'recommendations', 'boards'
  add_foreign_key 'recommendations', 'users'
  add_foreign_key 'taggings', 'tags'
end
