class PostsController < ApplicationController
  skip_before_action :authorized, :verify_authenticity_token

  def index
  	@posts = Post.all
  end

  #POST /posts
	def create
		@post = Post.new(post_params)
		if @post.save
			render json: @post
		else
			render error: { error: 'Unable to create Post.' }, status: 400
		end
	end

	private

	def post_params
		params.require(:post).permit(:username, :msg)
	end
end
