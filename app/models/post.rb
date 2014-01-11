class Post < ActiveRecord::Base
  has_many :comments
  validates :title, length: { maximum: 140 }, uniqueness: true
  validates :content, presence: true

  extend ::FriendlyId
  friendly_id :title, use: :slugged
end
