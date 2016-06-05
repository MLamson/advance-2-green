class Concept < ActiveRecord::Base
  validates :description, presence: true, length: { minimum: 3, maximum: 500 }
  validates :category, presence: true
  
end