class ArticlesController < ApplicationController
  	before_action :set_article, only: [:update, :destroy]

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

  	def update
  		if @article.update(article_params)
  			render json: @article
  		else
  			render @article.errors
  		end
  	end

  	def destroy
  		@article.destroy
  		render json: { message: 'removed' }, status: :ok
  	end

  	private
	    def set_article
	      @article = Article.find(params[:id])
	    end

	  	def article_params
	    	params.permit(:title, :body, :id)
	  	end
end
