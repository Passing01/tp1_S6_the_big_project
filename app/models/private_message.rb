class PrivateMessage < ApplicationRecord
  belongs_to :sender
  belongs_to :recipient,
  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"
end
