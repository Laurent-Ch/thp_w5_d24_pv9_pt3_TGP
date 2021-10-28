class JoinUserDm < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :dm
end
