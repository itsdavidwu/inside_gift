class CreateItemCategories < ActiveRecord::Migration
  def change
    create_table :item_categories do |t|
    	t.integer :item_id, :category_id
    	t.timestamps	
    end
  end
end
