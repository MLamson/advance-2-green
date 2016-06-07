class User < ActiveRecord::Base
  has_many :concepts
  before_save { self.email = email.downcase }
  
  validates :username, presence: true, length: { minimum: 3, maximum: 50 }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false },
  length: { maximum: 50 }, format: { with: VALID_EMAIL_REGEX }
end