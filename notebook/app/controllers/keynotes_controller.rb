class KeynotesController < ApplicationController
  def index
    Rails.logger.info 'Called KeynotesController#index'
    keynotes = KeynoteStore.get_keynotes

    render json: { keynotes: keynotes.values }
  end

  def update
    Rails.logger.info 'Called KeynotesController#update'

    keynote_id = params[:keynote_id]
    keynote = {
      'id' => keynote_id,
      'key' => params[:keynote][:key],
      'link' => params[:keynote][:link]
    }

    KeynoteStore.add_keynote(keynote_id, keynote)

    render json: { keynote: keynote }
  end

  def destroy
    Rails.logger.info 'Called KeynotesController#destroy'

    KeynoteStore.remove_keynote(params[:keynote_id])

    render json: success_json
  end
end
