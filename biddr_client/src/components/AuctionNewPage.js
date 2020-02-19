import React, { Component } from "react";

import { Auction } from "../api/auction";

export class AuctionNewPage extends Component {
  createAuction = event => {
    event.preventDefault();
    const { currentTarget } = event;
    const fd = new FormData(currentTarget);

    const newAuction = {
      title: fd.get("title"),
      description: fd.get("description"),
      ends_at: fd.get("ends_at"),
      reserve_price: fd.get("reserve_price")
    };

    Auction.create(newAuction).then(data => {
      if (!data.errors) {
        this.props.history.push(`/auctions/${data.id}`);
      }
    });

    currentTarget.reset();
  };

  render() {
    return (
      <form
        className="NewAuctionForm ui form"
        onSubmit={event => this.createAuction(event)}
      >
        <div className="field">
          <label htmlFor="title">Title</label>
          <input type="text" name="title" id="title" required />
        </div>
        <div className="field">
          <label htmlFor="description">Description</label>
          <textarea name="description" id="description" rows="3" required />
        </div>
        <div className="field">
          <label htmlFor="ends_at">Ends at</label>
          <input type="text" name="ends_at" id="ends_at" required />
        </div>
        <div className="field">
          <label htmlFor="reserve_price">Reserve Price</label>
          <input type="text" name="reserve_price" id="reserve_price" required />
        </div>
        <button className="ui orange button" type="submit">
          Create Auction
        </button>
      </form>
    );
  }
}