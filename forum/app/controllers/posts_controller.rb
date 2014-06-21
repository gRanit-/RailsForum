class PostsController < ApplicationController
    before_action :authenticate_user!
    respond_to :html, :js
    def new
        @post=Post.new
        @topic=Topic.find(params[:topic_id])
        @post.topic=@topic
    end
    def create
        @post = Post.new(post_params)
        @post.user=current_user
        @post.topic=Topic.find(params[:topic_id])
        @topic=Topic.find(@post.topic.id)
        if @post.save
            flash[:notice] = "You created a post"
            flash[:color] = "valid"
        else
            flash[:notice] = "Form is invalid"
            flash[:color] = "invalid"
        end
      
    end

  def user_posts
    @user=User.find(params[:id])
    @posts=@user.posts
    
    render "index"
  end  

    
    def index
        @posts=Post.all
    end
    def show
        @post = Post.find(params[:id])
    end
        def delete
         @post = Post.find(params[:post_id])
    end
    def destroy
        @post = Post.find(params[:id])
        @topic=Topic.find(@post.topic.id)
        @post.destroy if @post.user == current_user or current_user.admin

        
    end
      private
        def post_params
            puts params.inspect
            params.require(:post).permit(:title, :text,:post_id,:topic_id)
        end
end
