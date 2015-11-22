class Api::V1::TopicsController < Api::V1::BaseController
 # #22
   before_filter :authenticate_user, except: [:index, :show]
   before_filter :authorize_user, except: [:index, :show]
 
   def index
    #   @post = Post.find(params[:post_id])
    #   comment = @post.comments.new( params.require(:comment).permit(:body) )
       
       comments = Comment.all
       render json: comments.to_json, status: 200
   end
 
   def show
       comment = Comment.find(params[:id])
       render json: comment.to_json, status: 200
   end
end