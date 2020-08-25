class User < ApplicationRecord
  validates :name, presence: true
  validates :email, uniqueness: true, presence: true

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :parties, dependent: :destroy

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.id = auth.uid[1..2]
      user.google_token = auth.credentials.token
      user.google_refresh_token = auth.credentials.refresh_token
    end
  end
end
