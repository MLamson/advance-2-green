class Concept < ActiveRecord::Base
  belongs_to :user
  
  validates :description, presence: true, length: { minimum: 3, maximum: 500 }
  validates :category, presence: true
  validates :user_id, presence: true
end