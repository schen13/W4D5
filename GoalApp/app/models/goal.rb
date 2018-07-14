class Goal < ApplicationRecord
  validates :user_id, :description, :public, presence: true
  
  belongs_to :user,
    foreign_key: :user_id,
    class_name: :User
  
end
