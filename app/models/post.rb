class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_rich_text :body
  has_one :body, class_name: 'ActionText::RichText', as: :record
  validates :title, :position, presence: true
  validate :body_presence

  def body_presence
    errors.add(:body, "Can't be blank") unless body&.body&.present?
  end
end
