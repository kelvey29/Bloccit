class Rating < ActiveRecord::Base
    
    has_many :ratingings
    has_many :topics, through: :ratingings, source: :ratingable, source_type: :Topic
    has_many :posts, through: :ratingings, source: :ratingable, source_type: :Post
    
    def self.update_rating(rating_string)
       return false if label_string.blank?
    end
    
end
