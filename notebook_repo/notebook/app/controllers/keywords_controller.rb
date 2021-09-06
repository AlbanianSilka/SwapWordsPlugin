class KeywordsController < ApplicationController
  def index
    Rails.logger.info 'Called KeywordsController#index'
    keywords = KeywordStore.get_keywords

    render json: { keywords: keywords.values }
  end

  def update
    Rails.logger.info 'Called KeywordsController#update'

    keyword_id = params[:keyword_id]
    keyword = {
      'key' => params[:keyword][:key],
      'link' => params[:keyword][:link]
    }

    KeywordStore.add_keyword(keyword_id, keyword)

    render json: { keyword: keyword }
  end
end
