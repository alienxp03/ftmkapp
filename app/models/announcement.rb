class Announcement < ActiveRecord::Base
  validates :date, presence: true
  validates :title, uniqueness: true, presence: true
end
