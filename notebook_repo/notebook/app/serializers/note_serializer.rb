class NoteSerializer < ActiveModel::Serializer
  attributes :id, :content, :swap_words

  def swap_words
    object.content =  SwapService.execute(object.content)
  end
end
