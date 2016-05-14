class CommentsController < ApplicationController

  def users_comments
    posts = Post.all
    # comments = posts.map(&:comments).flatten
    comments = posts.map { |p| p.comments }.flatten
    @user_comments = comments.select do |comment|
      comment.author.username == params[:username]
    end
  end

end


class CommentsController < ApplicationController
  def users_comments
    User.find
    if user
        @comments = Comment.joins(:posts).joins(:author).where(authors: { username: params[:username] })
    else
        flash[:errors] = 'User does not exist'
    end
  end
end
