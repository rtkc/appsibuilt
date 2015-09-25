class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :title
      t.text :description
      t.text :functions
      t.integer :user_id

      t.timestamps
    end
  end
end
