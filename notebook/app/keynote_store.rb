class KeynoteStore
  class << self
    def get_keynotes
      PluginStore.get('notebook', 'keynotes') || {}
    end

    def add_keynote(keynote_id, keynote)
      keynotes = get_keynotes
      keynotes[keynote_id] = keynote
      PluginStore.set('notebook', 'keynotes', keynotes)

      keynote
    end

    def remove_keynote(keynote_id)
      keynotes = get_keynotes
      keynotes.delete(keynote_id)
      PluginStore.set('notebook', 'keynotes', keynotes)
    end
  end
end
