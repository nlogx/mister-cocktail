class Cocktail < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  before_save :cap_name

  belongs_to :user
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses

  validates :name, presence: true, uniqueness: true
  def cap_name
    self.name = name.split.map(&:capitalize).join(' ')
  end
end
