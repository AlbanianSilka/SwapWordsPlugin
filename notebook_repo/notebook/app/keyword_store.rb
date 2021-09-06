class KeywordStore
  class << self
    def get_keywords
      PluginStore.get('notebook', 'keywords') || {}
    end

    def add_keyword(keyword_id, keyword)
      keywords = get_keywords
      keywords[keyword_id] = keyword
      PluginStore.set('notebook', 'keywords', keywords)

      keyword
    end

    def remove_keyword(keyword_id)
      keywords = get_keywords
      keywords.delete(keyword_id)
      PluginStore.set('notebook', 'keywords', keywords)
    end
  end
end
