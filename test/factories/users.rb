FactoryBot.define do
  factory :user do
    email{'test_user@t.com'}
    name{'test_user'}
    password{'password'}
    password_confirmation{'password'}
    role{'admin'}
  end
end
