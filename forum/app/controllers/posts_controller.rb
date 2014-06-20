class PostsController < ApplicationController
    before_action :authenticate_user!
    def new
        @post=Post.new
    end
    def create
        @post = Post.new(post_params)
        if @post.save
            flash[:notice] = "You created a post"
            flash[:color] = "valid"
        else
            flash[:notice] = "Form is invalid"
            flash[:color] = "invalid"
        end
        redirect_to @post
    end
    def show
        @post = Post.find(params[:id])
    end
      private
        def post_params
            params.require(:post).permit(:title, :text)
        end
end
