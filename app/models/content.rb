class Content < ApplicationRecord
    has_many :content_actors,dependent: :destroy
    has_many :actors, through: :content_actors,dependent: :destroy
    validates :name, uniqueness: true
    validates :name, presence: true
end
