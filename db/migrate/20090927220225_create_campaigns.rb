class CreateCampaigns < ActiveRecord::Migration
  def self.up
    create_table :campaigns do |t|
      t.string :title
      t.text :description
      t.string :subject
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :campaigns
  end
end
