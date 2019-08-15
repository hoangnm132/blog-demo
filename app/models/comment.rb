class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :micropost

  validates :body, presence:true, length: {maximum: 160}

  scope :recent, -> { order(created_at: :DESC) }

end
