class CreateMailingLists < ActiveRecord::Migration
  def self.up
    create_table :mailing_lists do |t|
      t.string :title
      t.text :description
      t.string :category

      t.timestamps
    end
  end

  def self.down
    drop_table :mailing_lists
  end
end
