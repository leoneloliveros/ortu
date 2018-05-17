class WelcomeController < ApplicationController
  def index
  	@posts = Post.order(created_at: :desc).first(10)
  end
end
