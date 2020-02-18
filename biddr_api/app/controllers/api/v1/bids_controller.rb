class Api::V1::BidsController < ApplicationController
  
  def create 
    auction = Auction.find(params[:auction_id])
    new_bid = Bid.new bid_params
    new_bid.auction = auction
    if check_bid_amount(new_bid.bid_amount, auction.bids) == false
      render(
        json: { errors: "bid amount cannot be lower than the previous bids" }, 
        status: 422 # Unprocessable Entity
      )
    elsif new_bid.save 
      render json: { id: new_bid.id }
    else
      render(
        json: { errors: new_bid.errors }, 
        status: 422 # Unprocessable Entity
      )
    end
  end

  
  private 

  def check_bid_amount(bid_amount, bids)
    bid_allowed_flag = true
    bids.each do |bid|
      if bid_allowed_flag && bid.bid_amount >= bid_amount
        bid_allowed_flag = false
      end
    end
    return bid_allowed_flag
  end

  def bid_params 
    params.require(:bid).permit(:bid_amount, :auction_id)
  end
end
