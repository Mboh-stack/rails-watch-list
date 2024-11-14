class Movie < ApplicationRecord
  # Validations
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true

  # Associations
  has_many :bookmarks
  private

  # Méthode pour empêcher la suppression si des bookmarks existent
  def check_for_bookmarks
    if bookmarks.exists?
      errors.add(:base, "Cannot delete movie with associated bookmarks")
      throw(:abort)  # Annule la suppression
    end
  end
end
