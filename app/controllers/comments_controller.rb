# frozen_string_literal: true

# This is the controller for the Comments resource
class CommentsController < ApplicationController
  def new
    # Create a new comment object immediately upon entry of this method so that
    # a valid object exists when the Show etc. pages are first entered.
    # Otherwise, the error trapping done there will fail
    # @comment = Comment.new
  end

  def create
    #  Recall the id of the parent article is "known" by the nested routes for Comments,
    #  so params provides us with the parent article
    @article = Article.find(params[:id])
    @comment = @article.comments.create(whitelist_comment_params)
    redirect_to article_path(@article)
  end

  private

  def whitelist_comment_params
    params.require(:comment).permit(:commenter, :content)
  end
end
