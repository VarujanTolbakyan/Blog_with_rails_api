class Article < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title, presence: true, length: { minimum: 1, maximum: 100 }
  validates :body, presence: true, length: { minimum: 100 }

  enum category: %i(common medicine marketing fashion business news politics)


  before_save { self.published_at = Time.current }

  default_scope { order published_at: :desc }
  scope :filter_by_author, -> author_id { where user_id: author_id }

  def author_name
    user.name
  end

  def short_text_of_body
    body.length > 500 ? (body[0..499] + '....') : body
  end
end
