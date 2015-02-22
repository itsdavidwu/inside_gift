class CreateItemsRecipients < ActiveRecord::Migration
  def change
    create_table :items_recipients do |t|
    	t.integer :item_id, :recipients_id
    	t.timestamps	
    end
  end
end
