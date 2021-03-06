class CreateDesigns < ActiveRecord::Migration
  def self.up
    create_table :designs do |t|
      t.string :name
      t.string :description
      t.string :image_url

      t.timestamps
    end
  end

  def self.down
    drop_table :designs
  end
end
