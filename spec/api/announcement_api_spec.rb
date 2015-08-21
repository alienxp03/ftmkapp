require 'spec_helper'
require 'json'

describe 'GET /api/announcements' do
  context 'request' do
    it 'should return all announcements' do
      create_list(:announcement, 5)
      get '/api/announcements'
      json = JSON(response.body)

      expect(response.status).to eq(200)
      expect(json.count).to eq(Announcement.count)
    end
  end
end
