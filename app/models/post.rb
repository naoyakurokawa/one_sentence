class Post < ApplicationRecord
  has_one_attached :image
  validates :book_title, presence: true
  belongs_to :user
end
