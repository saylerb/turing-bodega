class VotesController < ApplicationController
  def create
    # byebug
    
    @vote = Vote.new(product_id: params[:product_id])
    @product = Product.find(params[:product_id])
    @vote.product = @product 
    if @vote.save
      flash[:notice] = "Successfully Voted for '#{@product.name}'"
    end
    redirect_to product_path(params[:product_id])
  end

end
