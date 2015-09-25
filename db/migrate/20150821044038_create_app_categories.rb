class CreateAppCategories < ActiveRecord::Migration
  def change
    create_table :app_categories do |t|
      t.integer :category_id, :app_id
      t.timestamps 
    end
  end
end
