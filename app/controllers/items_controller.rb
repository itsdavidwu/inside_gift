class ItemsController < ApplicationController
	 impressionist :actions=>[:show]

  def index

    if params[:price].present?

    @items = Item.where("price < #{params[:price]}").where("price > .01").order( 'impression_count DESC' ).paginate(page: params[:page], :per_page => 12).search(params[:search])

  else 
    @items = Item.order( 'impression_count DESC' ).paginate(page: params[:page], :per_page => 15).search(params[:search])
    
    end

  end


  def featured


    @category = Category.order("created_at DESC").take(5)

  if params[:price].present?

    @items = Item.where("price < #{params[:price]}").where("price > .01").order( 'impression_count DESC' ).paginate(page: params[:page], :per_page => 12).search(params[:search])

  else 
    @items = Item.order( 'impression_count DESC' ).paginate(page: params[:page], :per_page => 15).search(params[:search])
    
    end



  end

  def search 

  if params[:price].present?

    @items = Item.where("price < #{params[:price]}").where("price > .01").order( 'impression_count DESC' ).paginate(page: params[:page], :per_page => 12).search(params[:search])

  else 
    @items = Item.order( 'impression_count DESC' ).paginate(page: params[:page], :per_page => 15 ).search(params[:search])
    
    end

  end


  def show
  	@item = Item.find_by slug: params[:id]
  	@category = @item.categories
  	impressionist(@item)
  end

end
