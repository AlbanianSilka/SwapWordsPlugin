class NoteStore
  class << self
    def get_notes
      PluginStore.get('notebook', 'notes') || {}
    end

    def add_note(note_id, note)
      notes = get_notes
      update_note = note
      note_content = update_note["content"]
      note_content = SwapService.execute(note_content)
      update_note["content"] = note_content
      note = update_note
      notes[note_id] = note
      PluginStore.set('notebook', 'notes', notes)

      note
    end

    def remove_note(note_id)
      notes = get_notes
      notes.delete(note_id)
      PluginStore.set('notebook', 'notes', notes)
    end
  end
end
