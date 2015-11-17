require 'rails_helper'
include RandomData

RSpec.describe Rating, type: :model do
   let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
   let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user) }
   

   it { should have_many(:ratingings) }
   it { should have_many(:topics).through(:ratingings) }
   it { should have_many(:posts).through(:ratingings) }
   
   describe "ratingable" do
     it "allows the same rating to be associated with a different topic and post" do
       topic.ratings << rating
       post.ratings << rating
 
       topic_rating = topic.ratings[0]
       post_rating = post.ratings[0]

       expect(topic_rating).to eql(post_rating)
     end
   end
   
end
