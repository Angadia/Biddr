class Bid < ApplicationRecord
<<<<<<< HEAD
<<<<<<< HEAD
  belongs_to :user
=======
>>>>>>> ba93988... Added create, index, show actions for auctions controller; Added create action for bids controller.
=======
  belongs_to :user
>>>>>>> c4505a0... Added user authentication; Added create and destroy actions for new sessions controller; Added current action for new users controller.
  belongs_to :auction

  validates :bid_amount, numericality: {greater_than_or_equal_to: 0}
end
