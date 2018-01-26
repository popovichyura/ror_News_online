class ArticleCommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		params[:article_comment][:article_id]=params[:article_id]
		@comment=current_user.article_comments.build(comments_params)
		@comment.save 
		redirect_to article_path(params[:article_id])
	end

	def comments_params
		params.require(:article_comment).permit(:text,:user_id,:article_id)
	end
end
