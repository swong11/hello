#triggered when user enters page

class QuotesController < ApplicationController
  def index
  	@quote = Quote.order("RANDOM()").first  #reach out to model and go to db (quote.rb)
  end

#@quote is an "instance variable" 
 

  def create
  	@quote = Quote.create(quote_params)
  	if @quote.invalid?
  		flash[:error] = '<strong>Could not save</strong> the data you entered is invalid.'
  	end

  	redirect_to root_path
  end

  def about
  end

  def show
    @quote = Quote.where(:id => params[:id]).first
    if @quote.blank?
        render :text => "Not Found", :status => :not_found
    end
  end

  private

  def quote_params #requiring someone to submit something through the form and permit them to post something.
  	params.require(:quote).permit(:saying, :author)
  end
end