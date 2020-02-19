import React from "react";

export const BidDetails = props => {
  return (
    <div className="ui segment list">
      <p>
        ${props.bid_amount} on {new Date(props.created_at).toLocaleDateString()}
      </p>
    </div>
  );
};
