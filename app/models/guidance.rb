class Guidance < ActiveRecord::Base
  belongs_to :user
  
  validates :guidance, presence: true, length: { minimum: 3, maximum: 2500 }
  validates :author, presence: true
  validates :user_id, presence: true
end