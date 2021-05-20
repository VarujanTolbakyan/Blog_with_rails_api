class CommentFilter < BaseFilter

  FIELDS = %i(article_id commenter_id)

  define_params_fields_getters FIELDS

  def initialize(params, scope = Comment)
    @params = params || {}
    @scope = scope
  end

  def result
    return relation if params.blank?
    @search ||= chain_queries relation, :search_by_article, :search_by_commenter
  end

  private

  def search_by_article(relation)
    return relation unless article_id

    relation.filter_by_article article_id
  end

  def search_by_commenter(relation)
    return relation unless commenter_id

    relation.filter_by_commenter commenter_id
  end
end