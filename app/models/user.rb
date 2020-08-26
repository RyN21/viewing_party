class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :uid, presence: true, uniqueness: true
  validates :google_token, presence: true, uniqueness: true

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :parties, dependent: :destroy

  def self.from_omniauth(access_token)
    user = find_by(uid: access_token.uid)
    return user unless user.nil?

    User.create(email: access_token.info.email,
                username: access_token.info.email,
                uid: access_token.uid)
  end

  def friend_getter
    ActiveRecord::Base.connection.execute("SELECT \"users\".* FROM \"users\" INNER JOIN \"friendships\" ON \"users\".\"id\" = \"friendships\".\"friend_id\" WHERE \"friendships\".\"user_id\" = #{id}").map do |friend_hash|
      User.new(friend_hash)
    end
  end
end
