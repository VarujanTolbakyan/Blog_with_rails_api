class CommentSerializer < ApplicationSerializer
  attributes :body, :article_id
  attribute :user_id, key: :commenter_id

  #belongs_to :user
  #belongs_to :article
end
