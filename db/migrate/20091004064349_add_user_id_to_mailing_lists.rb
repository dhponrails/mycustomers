class AddUserIdToMailingLists < ActiveRecord::Migration
  def self.up
    add_column :mailing_lists, :user_id, :integer
  end

  def self.down
    remove_column :mailing_lists, :user_id
  end
end
