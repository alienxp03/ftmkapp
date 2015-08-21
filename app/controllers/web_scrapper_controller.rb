require 'nokogiri'
require 'open-uri'
require 'action_view'

class WebScrapperController < ApplicationController
  def scrape_data
    ulearn_url = 'http://ulearn.utem.edu.my/courses/ANNFTMK/document/ANNFTMK.html'

    open(ulearn_url, 'r', read_timeout: 30) do |http|
      doc = Nokogiri::HTML(http)
      table = doc.search('table').last.search('tr')

      latest_row = nil

      table.each do |row|
        date = validate_date(row.search('td')[0].text.squish)

        if date
          latest_row = encode(row.search('td')[1])
          break
        end
      end

      if Announcement.count == 0 || Announcement.last.title != latest_row
        migration(table)
      end
    end
  rescue Timeout::Error
    logger.debug "Timeout reading URL at #{DateTime.now}"
  end

  def validate_date(date)
    Date.parse(date)
  rescue ArgumentError
    nil
  end

  def encode(text)
    text.to_s.encode('UTF-8')
  end

  def migration(table)
    table.reverse_each do |row|
      data = {}
      data[:date] = row.search('td')[0].text.squish
      data[:title] = encode(row.search('td')[1]) if row.search('td')[1]
      data[:notes] = encode(row.search('td')[2]) if row.search('td')[2]

      Announcement.create(data)
    end
    logger.debug "Migrate new data at #{DateTime.now}"
  end
end
