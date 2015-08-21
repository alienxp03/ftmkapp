require 'nokogiri'

module APIHelpers
  def format_to_json
    announcements = []

    Announcement.all.each do |announcement|
      instance_variable_set('@title', Nokogiri::HTML(announcement.title))
      instance_variable_set('@notes', Nokogiri::HTML(announcement.notes))

      data = {}
      data[:date] = announcement.date
      data[:title] = instance_variable_get('@title').search('td').text.squish
      data[:notes] = instance_variable_get('@notes').text.squish

      %w(title notes).each do |text|
        data["#{text}_urls".to_sym] = generate_links(text)
      end

      announcements << data
    end
    announcements
  end

  def generate_links(text)
    links = []
    instance_variable_get("@#{text}").css('a').each do |href|
      link = {}
      link[:text] = href.text
      link[:url] = href['href']
      links << link
    end
    links
  end
end
