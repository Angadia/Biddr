class AuctionCollectionSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :ends_at, :reserve_price, :created_at, :updated_at
<<<<<<< HEAD
  belongs_to :user, key: :owner
=======
>>>>>>> ba93988... Added create, index, show actions for auctions controller; Added create action for bids controller.
end
