module LikesHelper
  def get_current_like(post)
    current_user.likes.find_by(likeable: post)
  end
end
