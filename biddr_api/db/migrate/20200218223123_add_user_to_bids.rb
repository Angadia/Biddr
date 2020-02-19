class AddUserToBids < ActiveRecord::Migration[6.0]
  def change
    add_reference :bids, :user, null: false, foreign_key: true
  end
end
