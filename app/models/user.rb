class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes
  has_one_attached :avatar


  followability

  def unfollow(user)
    followerable_relationships.where(followable_id: user.id).destroy_all
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token(0,20)
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.avatar = auth.info.picture
    end
  end
end
