class AddSlugToOccasions < ActiveRecord::Migration
  def change
  	add_column :occasions, :slug, :string  
  end
end
