class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, length: { maximum: 140 }, uniqueness: true
  validates :content, presence: true

  extend ::FriendlyId
  friendly_id :title, use: :slugged

  include RankedModel
  ranks :nav_order
end
