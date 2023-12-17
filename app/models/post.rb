class Post < ApplicationRecord
  belongs_to :user
  #validates :title, presence: true, length: { minimum: 2 }
  validates :body, presence: true
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable
  has_noticed_notifications model_name: 'Notfication'
  has_many :notifications, through: :user
  has_rich_text :body
end
