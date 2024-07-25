class Like < ApplicationRecord
  belongs_to :user
  belongs_to :likeable, polymorphic: true
  belongs_to :user
  belongs_to :gossip
end
