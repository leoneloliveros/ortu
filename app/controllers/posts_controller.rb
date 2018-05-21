class PostsController < ApplicationController
	def index
		@posts = Post.all
	end
	def show
		@post = Post.find(params[:id])
	end	
	def new
		@post = Post.new		
	end
	def create
		@post = Post.new(post_params)
		if @post.save
			@post.pictures.create(picture_params)
			redirect_to @post
		else
			render :new
		end
	end
	def edit
		@post = Post.find(params[:id])
	end
	def update
		post = Post.find(params[:id])
		if post.update(post_params)
			redirect_to post
		else
			render :edit
		end
	end
	def destroy
		post = Post.find(params[:id])
		post.destroy
		redirect_to posts_path	
	end
	private
	def post_params
		params.require(:post).permit(:title, :description, :image_url).merge(user: current_user)
	end
	def picture_params
		params.require(:picture).permit(:image_url).merge(pictureable_id: :post_id, pictureable_type: "post")
	end

end
