class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable,
         omniauth_providers: [:github]

  has_many :posts
  has_many :comments
  has_one :profile, dependent: :destroy

  after_create :init_profile


  def init_profile
    self.create_profile!
  end


  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    unless user
      user = User.create(
          email: data['email'],
          password: Devise.friendly_token[0,20]
      )
    end
    user
  end

end
