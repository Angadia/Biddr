class AuctionCollectionSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :ends_at, :reserve_price, :created_at, :updated_at
<<<<<<< HEAD
<<<<<<< HEAD
  belongs_to :user, key: :owner
=======
>>>>>>> ba93988... Added create, index, show actions for auctions controller; Added create action for bids controller.
=======
  belongs_to :user, key: :owner
>>>>>>> c4505a0... Added user authentication; Added create and destroy actions for new sessions controller; Added current action for new users controller.
end
