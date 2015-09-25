class AddColumnCategoriesToApps < ActiveRecord::Migration
  def change
    add_column :apps, :categories, :string
  end
end
