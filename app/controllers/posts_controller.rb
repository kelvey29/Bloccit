class PostsController < ApplicationController
  
  before_action :require_sign_in, except: :show
  before_action :authorize_user, except: [:show, :new, :create]
  before_action :load_post, except: [:new, :create]
  
  def show
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
  end
  
  def create
    
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.build(post_params)
    
    @post.user = current_user
    
    if @post.save
      @post.labels = Label.update_labels(params[:post][:labels]) unless Rails.env.test?
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
  end
  
  def update
     if @post.update_attributes(post_params)
       @post.labels = Label.update_labels(params[:post][:labels]) unless Rails.env.test?
       flash[:notice] = "Post was updated."
       redirect_to [@post.topic, @post]
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :edit
     end
  end
   
  def destroy
     if @post.destroy
       redirect_to @post.topic, notice: "\"#{@post.title}\" was deleted successfully."
     else
       flash[:error] = "There was an error deleting the post."
       render :show
     end
  end
  
  private
  
  def load_post
     @post = Post.find(params[:id])
  end
  def post_params
    params.require(:post).permit(:title, :body)
  end
  
  def authorize_user
    post = Post.find(params[:id])
    unless current_user == post.user || current_user.admin?
      flash[:error] = "You must be an admin to do that"
      redirect_to [post.topic, post]
    end
  end
end
