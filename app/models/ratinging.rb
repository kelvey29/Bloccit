class Ratinging < ActiveRecord::Base
    belongs_to :ratingable, polymorphic: true
    belongs_to :rating
end