class Post < ActiveRecord::Base
  validates :title, length: { maximum: 140 }
  validates :content, presence: true
end
