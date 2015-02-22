class EmailapiController < ApplicationController

	def index
	end

	def subscribe

	    @list_id = "cef154eab4"
	    gb = Gibbon::API.new

	    gb.lists.subscribe({
	      :id => @list_id,
	      :email => {:email => params[:email][:address]}
	      })
	   	
	   	flash.keep[:notice] = "Confirmation email has been sent"
	   	return redirect_to root_path
	end
end