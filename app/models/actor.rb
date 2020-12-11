class Actor < ApplicationRecord
    has_many :content_actors
    has_many :contents, through: :content_actors
    
    validates :name, uniqueness: true
    validates :name, presence: true
end
