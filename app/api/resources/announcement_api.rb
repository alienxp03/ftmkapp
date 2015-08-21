module Resources
  class AnnouncementApi < Grape::API
    helpers APIHelpers

    desc 'Get all announcements'
    params do
      optional :response_format,
               type: String, default: 'json', values: %w(html json),
               desc: 'Response format'
    end
    get do
      if params[:response_format] == 'html'
        present Announcement.all, with: Entities::AnnouncementEntity
      else
        announcements = format_to_json
        present announcements, with: Entities::AnnouncementEntity, type: :json
      end
    end
  end
end
