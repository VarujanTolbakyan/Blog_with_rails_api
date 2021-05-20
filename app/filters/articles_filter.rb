class ArticlesFilter < BaseFilter
  FIELDS = %i(category author_id)

  define_params_fields_getters FIELDS

  def initialize(params, scope = Article)
    @params = params || {}
    @scope = scope
  end

  def result
    return relation if params.blank?
    @search ||= chain_queries relation, :search_by_category, :search_by_author
  end

  private

  def search_by_category(relation)
    return relation unless category

    relation.send category
  end

  def search_by_author(relation)
    return relation unless author_id

    relation.filter_by_author author_id
  end
end
