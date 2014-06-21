class TopicsController < ApplicationController
    before_action :authenticate_user!
    respond_to :html, :js
    
    def new
        @topic=Topic.new
    end

  def user_topics
    @user=User.find(params[:id])
    @topics=@user.topics
    render "topics/index"
  end
    def create
        @topics=Topic.all
        @topic = Topic.new(topic_params)
        @topic.user=current_user
        @topic.save
        '''@topic = Topic.new(topic_params)
        
        if @topic.save
            flash[:notice] = "You created a topic"
            flash[:color] = "valid"
        else
            flash[:notice] = "Form is invalid"
            flash[:color] = "invalid"
        end
        redirect_to @topic'''
    end
    
    def show
        @topic = Topic.find(params[:id])   
    end   

    def index
        @topics=Topic.all
    end
    def showDescription
        @topic =Topic.find(params[:topic_id])
    end
    def delete
        @topics=Topic.all
        @topic = Topic.find(params[:topic_id])
    end
    def destroy
        @topics=Topic.all
        @topic = Topic.find(params[:id])
        @topic.destroy if @topic.user== current_user or current_user.admin
        
    end

    private
        def topic_params
            params.require(:topic).permit(:title, :text)
        end
end
