require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :username }
    it { should validate_uniqueness_of :uid }
    it { should validate_uniqueness_of :google_token }
    it { have_many(:followers).through(:following) }
    it { have_many(:follower_users).through(:followers) }
    it { have_many :followings }
    it { have_many(:followed_users).through(:followings) }
  end

  describe 'class methods' do
    describe 'from_omniauth' do
      it 'finds a user in the database' do
        stub_omniauth
        result = User.from_omniauth(stub_omniauth)

        expect(result.id).to eq(stub_omniauth.id)
        expect(result.id).to eq(stub_omniauth.id)
        expect(result.name).to eq(stub_omniauth.name)
        expect(result.username).to eq(stub_omniauth.info.email)
        expect(result.uid).to eq(stub_omniauth.uid)
      end
    end
  end
end
