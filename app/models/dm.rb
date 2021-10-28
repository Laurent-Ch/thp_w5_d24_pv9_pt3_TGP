class Dm < ApplicationRecord
  belongs_to :sender, class_name: "User"
  # Easy version 
  # Belongs_to :recipient, class_name: "User"
  has_many :join_user_dms
  has_many :recipients, class_name: 'User', through: :join_user_dms
end
