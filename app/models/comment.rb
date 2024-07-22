class Comment < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  belongs_to :commentable, polymorphic: true
  has_many :likes, as: :likeable
  belongs_to :user
  belongs_to :potin
end
