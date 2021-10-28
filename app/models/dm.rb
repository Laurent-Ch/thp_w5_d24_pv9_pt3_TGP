class Dm < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"

  # Version hard
  #has_many :join_user_dms
  #has_many :recipients, through: :join_user_dms

  # belongs_to :recipient, class_name: "User"
  # has_many :sent_messages, foreign_key: 'sender_id', class_name: "Dm"

end
