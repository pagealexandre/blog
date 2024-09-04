class ArticlesController < ApplicationController
	def index
		@articles = Article.all
		render json: @articles
	end

  	def create
    	@article = Article.build(article_params)

    	if @article.save
      		render json: @article, status: :created
    	else
      		render json: @article.errors, status: :unprocessable_entity
    	end
  	end

  	def article_params
    	params.permit(:title, :body)
  	end
end
