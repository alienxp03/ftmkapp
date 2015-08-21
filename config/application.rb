require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module LivelyplaylistBackend
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true

    config.paths.add File.join('app', 'api'), glob: File.join('**', '*.rb')
    config.autoload_paths += Dir[Rails.root.join('app', 'api', '*')]

    config.logger = Logger.new(STDOUT)

    config.middleware.insert_before 0, 'Rack::Cors' do
      allow do
        origins '*'
        resource '*', headers: :any,
                      methods: [:get, :post, :put, :delete, :options]
      end
    end
  end
end
