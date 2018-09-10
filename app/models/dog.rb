class Dog < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many_attached :images
end
