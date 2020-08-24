class User < ApplicationRecord
  validates :name, presence: true
  validates :email, uniqueness: true, presence: true

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.id = auth.uid
      user.google_token = auth.credentials.token
      user.google_refresh_token = auth.credentials.refresh_token

       User.create(username: access_data.info.email, uid: access_data.uid)
    end
  end
end


# def self.parse_omniauth(access_data)
#   user = find_by(uid: access_data.uid)
#   return user unless user.nil?
#
#   User.create(username: access_data.info.email, uid: access_data.uid)
# end
