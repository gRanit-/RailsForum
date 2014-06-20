class PostsController < ApplicationController
    before_action :authenticate_user!
    def new
        @post=Post.new
    end
    def create
        @post = Post.new(post_params)
        @post.user=current_user
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
    def destroy
        @post = Post.find(params[:id])
        @post.destroy if @post.user== current_user or current_user.admin
        redirect_to posts_path
    end
      private
        def post_params
            params.require(:post).permit(:title, :text,:post_id)
        end
end
