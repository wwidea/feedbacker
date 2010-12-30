class CreateRemarksTable < ActiveRecord::Migration
  def self.up
    create_table :remarks do |t|
      t.integer :user_id
      t.string :source_url
      t.text :content
      t.timestamps
    end
  end

  def self.down
    drop_table :remarks
  end
end
