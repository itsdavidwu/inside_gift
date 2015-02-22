class OccasionsController < ApplicationController
	helper_method :is_path?

  def show
  	@occasion = Occasion.find_by slug: params[:id]



  	if params[:price].present?
  	@items = @occasion.items.where("price < #{params[:price]}").where("price > .01").order( 'impression_count DESC' ).paginate(page: params[:page], :per_page => 12).search(params[:search])

     	else 
      	@items = @occasion.items.all

      	@items = @items.sort_by{|e| -e['impression_count']}
      	@items = @items.paginate(page: params[:page], :per_page => 15)
      	
      	end
  end

  	def is_path?(*paths)
  		paths.include?(request.path)
	end
  
end