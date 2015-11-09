class TopicsController < ApplicationController
    
    
    
    def show
       @topic = Topic.find(params[:id]) 
    end
    
    def new
       @sponsored_post = SponsoredPost.find(params[:sponsored_post_id])
       @topic = Topic.new 
    end
    
    def create
        @topic = Topic.new
        @topic.name = params[:topic][:name]
        @topic.description = params[:topic][:description]
        @topic.public = params[:topic][:public]
        @sponsored_post = SponsoredPost.find(params[:sponsored_post_id])
 
        @topic.sponsored_post = @sponsored_post
        
        if @topic.save
            flash[:notice] = "Topic was saved"
            redirect_to [@sponsored_post, @topic] 
            
        else
            flash[:error] = "Error creating topic. Please try again."
            render :new
        end
    end
    
    def edit
       @topic = Topic.find(params[:id]) 
    end
    
    def update
        @topic = Topic.find(params[:id])
 
        @topic.name = params[:topic][:name]
        @topic.description = params[:topic][:description]
        @topic.public = params[:topic][:public]
 
        if @topic.save
            flash[:notice] = "Topic was updated."
            redirect_to [@topic.sponsored_post, @topic]
        else
            flash[:error] = "Error saving topic. Please try again."
            render :edit
        end
    end
    
    def destroy
        @topic = Topic.find(params[:id])
 
        if @topic.destroy
            flash[:notice] = "\"#{@topic.name}\" was deleted successfully."
            redirect_to @topic.sponsored_post
        else
            flash[:error] = "There was an error deleting the topic."
            render :show
        end
    end
end
