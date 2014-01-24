class User < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  authenticates_with_sorcery!

  validates :password, length: { minimum: 8 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, uniqueness: true
  validates :username, uniqueness: true
end
