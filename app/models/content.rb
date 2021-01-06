class Content < ApplicationRecord
    has_many :content_actors
    has_many :actors, through: :content_actors
    validates :name, uniqueness: true
    validates :name, presence: true
end
