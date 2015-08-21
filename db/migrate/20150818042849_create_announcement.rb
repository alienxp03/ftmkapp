class CreateAnnouncement < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.date :date
      t.string :title
      t.string :notes
    end
  end
end
