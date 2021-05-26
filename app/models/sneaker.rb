class Sneaker < ApplicationRecord
  belongs_to :user
  has_one_attached :photo 
  belongs_to :category
end
