class SponsoredPost < ActiveRecord::Base
    has_many :topics, dependent: :destroy
    
end
