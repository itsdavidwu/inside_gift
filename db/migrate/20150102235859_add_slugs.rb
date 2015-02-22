class AddSlugs < ActiveRecord::Migration
  def change
  	add_column :items, :slug, :string
  	add_column :categories, :slug, :string
  end
end
