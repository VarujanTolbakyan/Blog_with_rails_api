class ArticleSerializer < ApplicationSerializer
  attributes  :title, :body, :category, :published_at, :comments_count

  #belongs_to :user
  #has_many :comments
end