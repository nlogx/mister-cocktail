class Cocktail < ApplicationRecord
  include PgSearch

  pg_search_scope :global_search, against: :name,
    associated_against: {
      user: :email,
      ingredients: :name
    },
    using: {
      tsearch: { # also trigram (fuzzy spelling) and dmetaphone (sound alikes)
        prefix: true,
        dictionary: 'english',
        negation: true,
        any_word: true
      }
    }

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
