class User < ApplicationRecord
  has_many :users,
  has_many :gossips
  has_many :sent_messages, class_name: "PrivateMessage", foreign_key: "sender_id",
  has_many :received_messages, class_name: "PrivateMessage", foreign_key: "recipient_id"
  has_many :potins
  has_many :comments
end
