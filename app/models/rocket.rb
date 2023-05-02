class Rocket < ApplicationRecord
    belongs_to :user
    has_many :reserveds
    # has_one_attached :image
end
