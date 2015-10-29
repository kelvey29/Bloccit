include RandomData
 
 # Create Posts
 50.times do

   Post.create!(

     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 posts = Post.all
 
 # Create Comments

 100.times do
   Comment.create!(

     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end
 
 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
 
 1.times do
     Post.find_or_create_by(
         title: "Noelle",
         body: "My sweet little angel baby"
         )
 end
 
 1.times do
     Comment.find_or_create_by(
         body: 'Von Miller Sack Dance'
         
         )
     end