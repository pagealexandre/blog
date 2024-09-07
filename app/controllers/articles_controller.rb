class ArticlesController < ApplicationController
	before_action :authorize_access_request!, only: [:create, :update, :destroy]
  	before_action :set_article, only: [:update, :destroy, :show]

	def index
		@articles = Article.all.order("created_at DESC")
		render json: @articles
	end

	def show
		render json: @article
	end

  	def create
  		byebug
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
	    	params.permit(:title, :body, :id, :user_id)
	  	end
end
