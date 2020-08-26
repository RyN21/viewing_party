FactoryBot.define do
  factory :friendship do
    user_id    { rand(1..1000) }
    friend_id  { rand(1..1000) }
    user
  end
end
