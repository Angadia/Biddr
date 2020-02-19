class Api::V1::BidsController < ApplicationController
<<<<<<< HEAD
<<<<<<< HEAD
  before_action :authenticate_user!

=======
  
>>>>>>> ba93988... Added create, index, show actions for auctions controller; Added create action for bids controller.
=======
  before_action :authenticate_user!

>>>>>>> c4505a0... Added user authentication; Added create and destroy actions for new sessions controller; Added current action for new users controller.
  def create 
    auction = Auction.find(params[:auction_id])
    new_bid = Bid.new bid_params
    new_bid.auction = auction
<<<<<<< HEAD
<<<<<<< HEAD
    new_bid.user = current_user
    if auction.user == current_user
      render(
        json: { errors: ["cannot bid on your own auction"] }, 
        status: 422 # Unprocessable Entity
      )
    elsif check_bid_amount(new_bid.bid_amount, auction.bids) == false
      render(
        json: { errors: ["bid amount cannot be lower than the previous bids"] }, 
=======
=======
    new_bid.user = current_user
>>>>>>> c4505a0... Added user authentication; Added create and destroy actions for new sessions controller; Added current action for new users controller.
    if check_bid_amount(new_bid.bid_amount, auction.bids) == false
      render(
        json: { errors: "bid amount cannot be lower than the previous bids" }, 
>>>>>>> ba93988... Added create, index, show actions for auctions controller; Added create action for bids controller.
        status: 422 # Unprocessable Entity
      )
    elsif auction.user == current_user
        render(
          json: { errors: "cannot bid on your own auction" }, 
          status: 422 # Unprocessable Entity
        )
    elsif new_bid.save 
      render json: { id: new_bid.id }
    else
      render(
<<<<<<< HEAD
        json: { errors: new_bid.errors.full_messages }, 
=======
        json: { errors: new_bid.errors }, 
>>>>>>> ba93988... Added create, index, show actions for auctions controller; Added create action for bids controller.
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
