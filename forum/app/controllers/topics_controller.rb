class TopicsController < ApplicationController
    before_action :authenticate_user!
    def new
        @topic=Topic.new
    end

    def create

        @topic = Topic.new(topic_params)
       # @topic.user_id(current_user.id)
        puts @topic.title
        @topic.user_id=current_user.id
        if @topic.save
            flash[:notice] = "You created a topic"
            flash[:color] = "valid"
        else
            flash[:notice] = "Form is invalid"
            flash[:color] = "invalid"
        end
        redirect_to @topic
    end
    
    def show
        @topic = Topic.find(params[:id])
    end
    
    def index
        @topics=Topic.all
    end
    
    def destroy
        @topic = Topic.find(params[:id])
        @topic.destroy if @topic.user.id == current_user.id or admin_signed_in?

        
 
        redirect_to topics_path
    end

    private
        def topic_params
            
            params.require(:topic).permit(:title, :text)
            #params.
        end
end
