class Api::V1::AuctionsController < ApplicationController
<<<<<<< HEAD
<<<<<<< HEAD
  before_action :authenticate_user!, except: [:index, :show]
  
  def create 
    auction = Auction.new auction_params
    auction.user = current_user
=======
  def create 
    auction = Auction.new auction_params 
>>>>>>> ba93988... Added create, index, show actions for auctions controller; Added create action for bids controller.
=======
  before_action :authenticate_user!, except: [:index, :show]
  
  def create 
    auction = Auction.new auction_params
    auction.user = current_user
>>>>>>> c4505a0... Added user authentication; Added create and destroy actions for new sessions controller; Added current action for new users controller.
    if auction.save 
      render json: { id: auction.id }
    else 
      render(
<<<<<<< HEAD
        json: { errors: auction.errors.full_messages }, 
=======
        json: { errors: auction.errors }, 
>>>>>>> ba93988... Added create, index, show actions for auctions controller; Added create action for bids controller.
        status: 422 # Unprocessable Entity
      )
    end
  end

  def index 
    auctions = Auction.order(created_at: :desc)
    render json: auctions, each_serializer: AuctionCollectionSerializer
  end

  def show 
    auction = Auction.find(params[:id])
<<<<<<< HEAD
<<<<<<< HEAD
    render json: auction, include: [:owner, {bids: [:bidder]} ]
=======
    render json: auction
>>>>>>> ba93988... Added create, index, show actions for auctions controller; Added create action for bids controller.
=======
    render json: auction, include: [:owner, {bids: [:bidder]} ]
>>>>>>> c4505a0... Added user authentication; Added create and destroy actions for new sessions controller; Added current action for new users controller.
  end

  private

  def auction_params
    params.require(:auction).permit(:title, :description, :ends_at, :reserve_price)
  end
end
