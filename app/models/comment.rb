class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_rich_text :body
  has_many :likes, as: :likeable
  
  after_create_commit :notify_recipient 
  before_destroy :cleanup_notfications 
  has_noticed_notifications model_name: 'Notification'

  private 

  def notify_recipient
    return if post.user == user

    CommentNotification.with(comment: self, post: post).deliver_later(post.user)
  end

  def cleanup_notfications
    notifications_as_comment.destroy_all
  end
end
