class ItemRecipient < ActiveRecord::Base
	belongs_to :item
	belongs_to :recipient
end