class Topic < ActiveRecord::Base
    belongs_to :sponsored_post
    
    has_many :posts
end
