class User < ActiveRecord::Base
  has_many :concepts, dependent: :destroy
  has_many :stories, dependent: :destroy
  has_many :guidances, dependent: :destroy
  before_save { self.email = email.downcase }
  before_create :confirmation_token
  
  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end
  
  validates :username, presence: true, length: { minimum: 3, maximum: 50 }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false },
  length: { maximum: 50 }, format: { with: VALID_EMAIL_REGEX }
  
  has_secure_password
  
  private
  
  def confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end
  
end