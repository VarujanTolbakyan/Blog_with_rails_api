class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :body, presence: true, length: { minimum: 1, maximum: 1000 }

  default_scope { order updated_at: :desc }
  scope :filter_by_commenter, -> commenter_id { where user_id: commenter_id }
  scope :filter_by_article, -> article_id { where article_id: article_id }
end
