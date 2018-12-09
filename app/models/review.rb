class Review < ApplicationRecord
  belongs_to :cocktail
  belongs_to :user
  validates :content, length: { minimum: 10 }
end
