require 'rufus/scheduler'

if Rails.env.production?
  scheduler = Rufus::Scheduler.singleton

  scheduler.every '1h', first_in: '10s' do
    WebScrapperController.new.scrape_data
  end
end
