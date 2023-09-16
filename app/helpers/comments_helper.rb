module CommentsHelper
    def get_comments(post)
      post.comments.includes(:user, :rich_text_body).order(created_at: :desc)
    end
  end