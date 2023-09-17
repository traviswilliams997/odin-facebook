class LikesController < ApplicationController
  include LikesHelper
  def create 
    @like = current_user.likes.new(likes_params)
    unless @like.save 
      flash[:notice] = @like.errors.full_messages.to_sentence
    end

    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    @like.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def likes_params
    params.require(:like).permit(:likeable_id, :likeable_type)
  end
end
