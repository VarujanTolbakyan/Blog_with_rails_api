class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :body, presence: true, length: {minimum: 1, maximum: 1000}

  default_scope {order updated_at: :desc}
end
