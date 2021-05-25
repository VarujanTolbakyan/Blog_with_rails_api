class ArticlesSerializer < ArticleSerializer
  def body
    object.short_text_of_body
  end
end