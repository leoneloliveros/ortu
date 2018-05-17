class PicturesController < ApplicationController
	def new
		@p = Post.find(params[:id])
		@picture = @p.pictures.new
		
	end
end
