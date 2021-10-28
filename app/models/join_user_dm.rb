class JoinUserDm < ApplicationRecord
  belongs_to :dm
  belongs_to :recipient, class_name: "User"
end
