class Potin < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :title, presence: true
  validates :content, presence: true
  validate :validate_image

  def validate_image
    errors.add(:image_data, "n'est pas une image valide") unless image_data[:type].start_with?("image/")
  end

end