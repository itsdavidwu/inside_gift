require 'uri'
require 'json'
require 'httparty'
require 'nokogiri'
require 'open-uri'
require 'amazon/ecs'

task :add_item, [:id] => :environment do |t, args|
  amazon_id = args.id
 
  if (Item.all(:source_id => amazon_id).length == 0)
    response = Amazon::Ecs.item_lookup(amazon_id, {:response_group => 'Large'})
    info = response.items[0]
 
    if (!info.nil?)
      title = info.get('ItemAttributes/Title')
      link = "http://www.amazon.com/dp/#{amazon_id}/"
      #image_s3 = "https://s3.amazonaws.com/uncoverly/product-images/#{amazon_id}.jpg"
      product_group = info.get('ItemAttributes/ProductGroup')
      price = (info.get('Offers/Offer/OfferListing/Price/Amount').to_i / 100.0).to_i
      currency = info.get('Offers/Offer/OfferListing/Price/CurrencyCode')
      avail = info.get('Offers/Offer/OfferListing/AvailabilityAttributes/AvailabilityType')
      desc = info.get('EditorialReviews/EditorialReview/Content')
      if (!desc.nil? && (desc.include? "&lt;p&gt;"))
        cleaned = Nokogiri::HTML(CGI.unescapeHTML(desc))
        first_par = cleaned.css('p')[0]
        if (!first_par.nil?)
          desc = first_par.text
        end
      end
 
      item = Item.new
      item.attributes = { 
        :source => 'amazon', 
        :source_id => amazon_id,
        :title => title,
        :price => price,
        :link => link,
        #:image_s3 => image_s3,
        :product_group => product_group,
        :description => desc,
        :recent_price => price,
        :currency_code => currency,
        :availability => avail,
      }
      item.save      
      puts "item added!"
 
      new_item = Item.first(:source_id => amazon_id)
      puts new_item.id
    else
      puts "amazon lookup was no-go"
    end
  else
    puts "item already in there!"
  end
 
end