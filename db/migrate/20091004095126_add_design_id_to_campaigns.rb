class AddDesignIdToCampaigns < ActiveRecord::Migration
  def self.up
    add_column :campaigns, :design_id, :integer
  end

  def self.down
    remove_column :campaigns, :design_id
  end
end
