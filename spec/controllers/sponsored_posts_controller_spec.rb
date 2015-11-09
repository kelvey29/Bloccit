require 'rails_helper'
include RandomData

RSpec.describe SponsoredPostsController, type: :controller do

    let(:my_sponsored_post) { SponsoredPost.create(title: RandomData.random_sentence, body: RandomData.random_paragraph) }
    
    describe "GET index" do
        it "returns http success" do
            get :index
            expect(response).to have_http_status(:success)
        end
        
        it "assigns my_sponsored_post to @sponsored_posts" do
           get :index
           expect(assigns(:sponsored_posts)).to eq([my_sponsored_post])
        end
    end
    
    describe "GET show" do
       it "returns http success" do
           get :show, {id: my_sponsored_post.id}
           expect(response).to have_http_status(:success)
       end
       
       it "renders the #show view" do
           get :show, {id: my_sponsored_post.id}
           expect(response).to render_templete :show
       end
       
       it "assigns my_sponsored_post to @sponsored_post" do
           get :show, {id: my_sponsored_post.id}
           expect(assigns(:sponsored_post)).to eq(my_sponsored_post)
       end
    end
    
    describe "GET new" do
        it "returns http success" do
            get :new
            expect(response).to have_http_status(:success)
        end
        
        it "renders the #new view" do
            get :new
            expect(response).to render_templete :new
        end
        
        it "initializes @sponsored_post" do
            get :new
            expect(assigns(:sponsored_post)).not_to be_nil
        end
    end
    
     describe "POST create" do
     it "increases the number of sponsored_post by 1" do
       expect{ post :create, {sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}}.to change(SponsoredPost,:count).by(1)
     end
   
     it "assigns SponsoredPost.last to @sponsored_post" do
       post :create, {sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}
       expect(assigns(:sponsored_post)).to eq SponsoredPost.last
     end
 
     it "redirects to the new topic" do
       post :create, {sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}
       expect(response).to redirect_to SponsoredPost.last
     end
   end
 
    describe "GET edit" do
     it "returns http success" do
       get :edit, {id: my_sponsored_post.id}
       expect(response).to have_http_status(:success)
     end
 
     it "renders the #edit view" do
       get :edit, {id: my_sponsored_post.id}
       expect(response).to render_template :edit
     end
 
     it "assigns sponsored_post to be updated to @sponsored_post" do
       get :edit, {id: my_sponsored_post.id}
       sponsored_post_instance = assigns(:sponsored_post)
 
       expect(sponsored_post_instance.id).to eq my_sponsored_post.id
       expect(sponsored_post_instance.title).to eq my_sponsored_post.title
       expect(sponsored_post_instance.body).to eq my_sponsored_post.body
     end
   end 
   
   describe "PUT update" do
     it "updates sponsored post with expected attributes" do
       new_title = RandomData.random_sentence
       new_body = RandomData.random_paragraph
 
       put :update, id: my_sponsored_post.id, sponsored_post: { title: new_title, body: new_body }
 
       updated_sponser = assigns(:sponsored_post)
       expect(updated_sponser.id).to eq my_sponsored_post.id
       expect(updated_sponser.title).to eq new_title
       expect(updated_sponser.body).to eq new_body
     end
 
     it "redirects to the updated sponsered post" do
       new_title = RandomData.random_sentence
       new_body = RandomData.random_paragraph
 
       put :update, id: my_sponsored_post.id, sponsored_post: { title: new_title, body: new_body }
       expect(response).to redirect_to my_sponsored_post
     end
   end
   
   describe "DELETE destroy" do
     it "deletes the sponsor" do
       delete :destroy, {id: my_sponsored_post.id}
       count = Topic.where({id: my_sponsored_post.id}).size
       expect(count).to eq 0
     end
   
     it "redirects to sponsor index" do
       delete :destroy, {id: my_sponsored_post.id}
       expect(response).to redirect_to sponsored_posts_path
     end
   end
    
end
