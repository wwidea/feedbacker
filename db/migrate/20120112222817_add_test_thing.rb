class AddTestThing < ActiveRecord::Migration
  def change
    create_table :test_things do |t|
      t.integer :user_id
      t.string :source_url
      t.text :content
      t.timestamps
    end
  end
end
