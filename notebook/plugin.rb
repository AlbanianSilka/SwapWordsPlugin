enabled_site_setting :notebook_enabled

register_asset 'stylesheets/notebook.css'

load File.expand_path('../app/note_store.rb', __FILE__)
load File.expand_path('../app/keynote_store.rb', __FILE__)
load File.expand_path('../app/services/swap_service.rb', __FILE__ )

after_initialize do
  load File.expand_path('../app/controllers/notebook_controller.rb', __FILE__)
  load File.expand_path('../app/controllers/notes_controller.rb', __FILE__)
  load File.expand_path('../app/controllers/keynotes_controller.rb', __FILE__)

  Discourse::Application.routes.append do
    get '/notebook' => 'notebook#index'

    get '/keynotes' => 'keynotes#index'
    get '/notes' => 'notes#index'
    put '/notes/:note_id' => 'notes#update'
    put '/keynotes/:keynote_id' => 'keynotes#update'
    delete '/notes/:note_id' => 'notes#destroy'
    delete '/keynotes/:keynote_id' => 'keynotes#destroy'
  end
end
