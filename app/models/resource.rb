class Resource < ActiveRecord::Base
  belongs_to :user
  
  validates :resource, presence: true, length: { minimum: 3, maximum: 2500 }
  validates :name, presence: true
  validates :user_id, presence: true
end