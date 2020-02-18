class AuctionSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :ends_at, :reserve_price, :created_at, :updated_at

<<<<<<< HEAD
  belongs_to :user, key: :owner
=======
>>>>>>> ba93988... Added create, index, show actions for auctions controller; Added create action for bids controller.
  has_many :bids

  class BidSerializer < ActiveModel::Serializer
    attributes :id, :bid_amount, :created_at, :updated_at
<<<<<<< HEAD
    belongs_to :user, key: :bidder
  end
=======
  end

>>>>>>> ba93988... Added create, index, show actions for auctions controller; Added create action for bids controller.
end
