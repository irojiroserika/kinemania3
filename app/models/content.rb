class Content < ApplicationRecord
    has_many :content_actors
    has_many :actors, through: :content_actors
    


end
