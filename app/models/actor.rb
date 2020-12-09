class Actor < ApplicationRecord
    has_many :content_actors
    has_many :contents, through: :content_actors
    
end
