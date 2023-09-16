class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { minimum: 2 }
  validates :body, presence: true, length: { in: 5..100 }
  has_many :comments, dependent: :destroy
end
