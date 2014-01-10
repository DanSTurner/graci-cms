class Post < ActiveRecord::Base
  validates :title, length: { maximum: 140 }, uniqueness: true
  validates :content, presence: true
end
