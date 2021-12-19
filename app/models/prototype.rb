class Prototype < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :consept, presence: true
  validates :image, presence:true, unless: :was_attached?
  def was_attached?
    self.image.attached?
  end
end
