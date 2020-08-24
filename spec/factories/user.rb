FactoryBot.define do
  factory :user do
    name                 { Faker::FunnyName.name }
    uid                  { Faker::Number.within(range: 100000..999999) }
    google_token         { Faker::Number.within(range: 100000..999999) }
    google_refresh_token { Faker::Number.within(range: 100000..999999) }
    sequence :email do |n|
      "test#{n}@test.com"
    end
  end

  factory :omniauth_mock_user, parent: :user do
    username { 'john@example.com' }
    uid {'100000000000000000000'}
    google_token {'MOCK_OMNIAUTH_GOOGLE_TOKEN'}
    google_refresh_token {'MOCK_OMNIAUTH_GOOGLE_REFRESH TOKEN'}
  end
end
