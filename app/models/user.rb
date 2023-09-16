class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy



  followability

  def unfollow(user)
    followerable_relationships.where(followable_id: user.id).destroy_all
  end
end
