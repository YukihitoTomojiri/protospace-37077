class Comment < ApplicationRecord
  belongs_to :users
  belongs_to :prototypes

  validates :comment, presence: :true
end
