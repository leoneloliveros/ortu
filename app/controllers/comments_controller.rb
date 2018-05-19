class CommentsController < ApplicationController
	def show
		@task = Task.find(params[:id])
	end
	def create
		@task = Task.find(params[:task_id])
  		@task.comments.create(comment_params)
  		@comment = Comment.last
	end
	private
	def comment_params
		params.require(:comment).permit(:text).merge(user: current_user)	
	end
end
