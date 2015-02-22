class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
    	t.string :source
    	t.string :source_id
    	t.string :title
    	t.decimal :price
    	t.string :link
    	t.string :image
    	t.string :product_group
    	t.string :description
    	t.string :currency
    	t.string :availability
    end
  end
end