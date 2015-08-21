module Entities
  class AnnouncementEntity < Grape::Entity
    expose :date, documentation: { type: 'string', desc: 'Date' }
    expose :title, documentation: { type: 'string', desc: 'Main announcement' }
    expose :title_urls,
           documentation: { type: 'URLDetailsEntity', desc: 'URLs for title' },
           if: { type: :json }
    expose :notes, documentation: { type: 'string', desc: 'Additional notes' }
    expose :notes_urls,
           documentation: { type: 'URLDetailsEntity', desc: 'URLs for notes' },
           if: { type: :json }
  end

  class URLDetailsEntity < Grape::Entity
    expose :text, documentation: { type: 'string', desc: 'Title' }
    expose :url, documentation: { type: 'string', desc: 'URL for the title' }
  end
end
