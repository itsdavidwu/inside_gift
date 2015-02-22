class CreateItemOccasions < ActiveRecord::Migration
  def change
    create_table :item_occasions do |t|
    	t.integer :item_id, :occasion_id
    	t.timestamps	
    end
  end
end
