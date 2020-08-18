class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :profile, presence: true
  validates :openid, presence: true
  validates :google_token, uniqueness: true, presence: true
  validates :google_refresh_token, uniqueness: true, presence: true
end
