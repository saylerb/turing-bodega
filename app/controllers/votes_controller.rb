class VotesController < ApplicationController
  before_action :require_login

  def create
    @vote = Vote.new(product_id: params[:product_id])
    @product = Product.find(params[:product_id])
    @vote.product = @product 
    @vote.user = current_user

    if @vote.save
      flash[:notice] = "Successfully Voted for '#{@product.name}'"
      redirect_to product_path(params[:product_id])
    else
      flash[:alert] = "Sorry, you've already voted"
      redirect_to product_path(params[:product_id])
    end
  end

  def require_login
    unless current_user
      flash[:alert] = "Sorry, you need to be logged in to do that"
      redirect_to product_path(params[:product_id])
    end
  end

end
