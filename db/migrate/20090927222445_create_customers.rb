class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :firstname
      t.string :lastname
      t.integer :birthmonth
      t.integer :birthday
      t.string :email
      t.string :phone
      t.string :subscriptionkey

      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
