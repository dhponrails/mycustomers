class AddMailingListIdToCustomers < ActiveRecord::Migration
  def self.up
    add_column :customers, :mailing_list_id, :integer
  end

  def self.down
    remove_column :customers, :mailing_list_id
  end
end
