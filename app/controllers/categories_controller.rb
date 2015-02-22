class CategoriesController < ApplicationController
require 'will_paginate/array'

  def show
  	@category = Category.find_by slug: params[:id]



  	if params[:price].present?
  	@items = @category.items.where("price < #{params[:price]}").where("price > .01").order( 'impression_count DESC' ).paginate(page: params[:page], :per_page => 12).search(params[:search])

     	else 
      	@items = @category.items.all

      	@items = @items.sort_by{|e| -e['impression_count']}
      	@items = @items.paginate(page: params[:page], :per_page => 12)
      	
      	end


  end


end