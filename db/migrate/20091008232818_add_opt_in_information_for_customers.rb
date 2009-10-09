class AddOptInInformationForCustomers < ActiveRecord::Migration
  def self.up
    add_column :customers, :confirmed, :bool
    add_column :customers, :ip_address, :string
    add_column :customers, :time_confirmed, :datetime
  end

  def self.down
   remove_column :customers, :confirmed
   remove_column :customers, :ip_address
   remove_column :customers, :time_confirmed
  end
end
