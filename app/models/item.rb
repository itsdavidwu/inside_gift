class Item < ActiveRecord::Base

	is_impressionable :counter_cache => true, :column_name => :impression_count,  :unique => true

	has_many :item_interests
	has_many :item_categories
	has_many :categories, through: :item_categories
	has_many :occasions, through: :item_occasions

	before_save :generate_slug

	def to_param
		self.slug
	end

	def generate_slug
		str = self.title.strip
	    str1 = str.gsub! /\s*[^A-Za-z0-9]\s*/, '-'
	    str2 = str1.gsub! /-+/, "-"
	    self.slug = str2.downcase
	end

	def self.search(search)
		if search
			find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
		else
			find(:all)
		end
	end
end