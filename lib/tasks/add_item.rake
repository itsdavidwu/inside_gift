require 'uri'
require 'json'
require 'httparty'
require 'nokogiri'
require 'open-uri'
require 'amazon/ecs'
require 'cgi'

task :add_item, [:id] => :environment do |t, args|
  amazon_id = args.id
 
  if Item.exists?(:source_id => amazon_id)
    puts "item already in there!"

  else
    response = Amazon::Ecs.item_lookup(amazon_id, {:response_group => 'Large'})
    info = response.items[0]

    image = Amazon::Ecs.item_lookup(amazon_id, {:response_group => 'Images'})
    info2 = response.items[0]

    trueprice = Amazon::Ecs.item_lookup(amazon_id, {:response_group => 'Variations'})
    info3 = response.items[0]
 
    if (!info.nil?)
      title = info.get('ItemAttributes/Title')
      link = "http://www.amazon.com/dp/#{amazon_id}/"
      image = info2.get('ImageSets/ImageSet/LargeImage/URL')
      product_group = info.get('ItemAttributes/ProductGroup')
      price = (info.get('Offers/Offer/OfferListing/Price/Amount').to_i / 100.0).to_i
      currency = info.get('Offers/Offer/OfferListing/Price/CurrencyCode')
      avail = info.get('Offers/Offer/OfferListing/AvailabilityAttributes/AvailabilityType')
      desc = info.get('EditorialReviews/EditorialReview/Content')
      desc2 = Nokogiri::HTML.parse(desc) 
      desc3 = desc2.text
 
      item = Item.new
      item.attributes = { 
        :source => 'amazon', 
        :source_id => amazon_id,
        :title => title,
        :price => price,
        :link => link,
        :image => image,
        :product_group => product_group,
        :description => desc3,
        #:recent_price => price,
        :currency => currency,
        :availability => avail,
      }
      item.save      
      puts "item added!"
 
      new_item = Item.where(:source_id => amazon_id).first
      puts new_item.id
    else
      puts "amazon lookup was no-go"
    end
  end 
end