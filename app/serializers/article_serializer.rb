class ArticleSerializer < ApplicationSerializer
  attributes  :title, :body, :category, :published_at, :comments_count
  attribute :user_id, key: :author_id

  #belongs_to :user
  #has_many :comments
end