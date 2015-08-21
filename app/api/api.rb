class API < Grape::API
  prefix 'api'
  format :json
  content_type :json, 'application/json'
  default_format :json

  before do
    params.delete(:route_info)
  end

  namespace do
    group(:announcements) { mount Resources::AnnouncementApi }
    add_swagger_documentation(
      hide_documentation_path: true
    )
  end

  rescue_from ActiveRecord::RecordNotFound do
    Rack::Response.new(['UnauthorizedError: Unauthorized'], 401).finish
  end
end
