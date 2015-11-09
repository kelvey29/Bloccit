class SponsoredPostsController < ApplicationController
    
    def index
       @sponsored_posts = SponsoredPost.all 
    end
    
    def show
       @sponsored_post = SponsoredPost.find(params[:id]) 
    end
    
    def new
       @sponsored_post = SponsoredPost.new 
    end
    
    def create
       @sponsored_post = SponsoredPost.new
       @sponsored_post.title = params[:sponsored_post][:title]
       @sponsored_post.body = params[:sponsored_post][:body]
       
 
        if @sponsored_post.save
            redirect_to @sponsored_post, notice: "Sponsored post was saved successfully."
        else
            flash[:error] = "Error creating post. Please try again."
            render :new
        end
    end
    
    def edit
       @sponsored_post = SponsoredPost.find(params[:id]) 
    end
    
    def update
        @sponsored_post = SponsoredPost.find(params[:id])
 
        @sponsored_post.title = params[:sponsored_post][:title]
        @sponsored_post.body = params[:sponsored_post][:body]
        
        if @sponsored_post.save
            flash[:notice] = "Sponsor was updated."
            redirect_to @sponsored_post
        else
            flash[:error] = "Error saving sponsor. Please try again."
            render :edit
        end
    end
    
    def destroy
        @sponsored_post = SponsoredPost.find(params[:id])
 
        if @sponsored_post.destroy
            flash[:notice] = "\"#{@sponsored_post.title}\" was deleted successfully."
            redirect_to action: :index
        else
            flash[:error] = "There was an error deleting the topic."
            render :show
        end
    end
end
