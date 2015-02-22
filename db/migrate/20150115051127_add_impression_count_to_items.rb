class AddImpressionCountToItems < ActiveRecord::Migration
  def change
  	add_column  :items, :impression_count, :integer, :default => 0
  end
end
