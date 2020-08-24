class User < ApplicationRecord
  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :uid, presence: true, uniqueness: true
  validates :google_token, presence: true, uniqueness: true

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  # def self.from_omniauth(auth)
  #   where(email: auth.info.email).first_or_initialize do |user|
  #     user.name = auth.info.name
  #     user.email = auth.info.email
  #     user.uid = auth.uid
  #     user.google_token = auth.credentials.token
  #     user.google_refresh_token = auth.credentials.refresh_token
  #
  #     User.create(username: access_token.info.email, uid: access_token.uid)
  #   end
  # end

  def self.from_omniauth(access_token)
    user = find_by(uid: access_token.uid)
    return user unless user.nil?

    User.create(name: access_token.name, username: access_token.info.email, uid: access_token.uid)
  end
end
