class User < ApplicationRecord
  belongs_to :city
  
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "Dm"
  
  has_many :join_user_dms  
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "Dm", through: :join_user_dms

  has_many :join_tag_gossips
  has_many :gossips, through: :join_tag_gossips
end

