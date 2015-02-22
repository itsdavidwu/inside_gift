class AddSlugToRecipients < ActiveRecord::Migration
  def change
 	add_column :recipients, :slug, :string  
  end
end
