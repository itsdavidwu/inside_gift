class Category < ActiveRecord::Base
	has_many :item_categories
	has_many :items, through: :item_categories


	before_save :generate_slug

	def to_param
		self.slug
	end

	def generate_slug
		self.slug = self.name.gsub(" ", "-").downcase
	end
end