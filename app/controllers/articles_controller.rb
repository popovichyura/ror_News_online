class ArticlesController < ApplicationController
	before_action :authenticate_user!, only:[:create,:new,:edit,:update]
	before_action :set_article, only:[:edit,:update,:destroy,:show]
      
	def new
      @article = Article.new
	end

	def create
		if current_user.role == "Editor"	
	   params[:article][:category_id]=params[:category_id]
        @article = current_user.articles.build(article_params)
        if @article.save
      	  redirect_to root_path
        else
      	  render 'new'
        end
    end
	end

	def edit
		
	end

	def update
	  @article.update(article_params)
	  redirect_to root_path	
	end

	def destroy
	  @article.destroy
	  redirect_to root_path
	end

	def show
		@comments=ArticleComment.where(article_id: params[:id])
	end

	
	def categories
        @articles=Article.where(category_id: params[:id])
	end

	private

	def article_params
	pp  params.require(:article).permit(:user_id, :category_id, :title, :shortbody, :body)
	end

	def set_article
		@article=Article.find(params[:id])
	end
end