class User < ApplicationRecord
  has_secure_password
  validates :email, :format => { :with => /\w+[@]\w+[.]\w{1}\w+/}, uniqueness: true, :presence => true
  validates :first_name, presence: true, on: :create
  validates :last_name, presence: true, on: :create
  validates :password, presence: true, on: :create
  validates :password, length: {in: 8..20}, on: :create
  has_many :posts, dependent: :destroy
  has_many :authentications, dependent: :destroy

    def self.create_with_auth_and_hash(authentication, auth_hash)
       user = self.create!(
       	 first_name: auth_hash["info"]["first_name"],
      	 last_name: auth_hash["info"]["last_name"],
      	 email: auth_hash["info"]["email"],
      	 password: SecureRandom.hex(10)
      )	
      user.authentications << authentication
      return user
    end

    # grab google to access google for user data
    def google_token
      x = self.authentications.find_by(provider: 'google_oauth2')
      return x.token unless x.nil?
    end

    def full_name
       "#{self.first_name} #{self.last_name}"
    end
end