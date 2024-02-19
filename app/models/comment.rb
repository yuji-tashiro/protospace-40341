class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :prototype

  validates :content,   presence: true, length: { maximum: 255 }
  validates :user,      presence: true
  validates :prototype, presence: true
end
