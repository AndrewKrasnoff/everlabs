class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, :body, :position, presence: true
end
