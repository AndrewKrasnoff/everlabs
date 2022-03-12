class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, :body, :position, presence: true
  has_rich_text :body
  has_one :body, class_name: 'ActionText::RichText', as: :record
end
