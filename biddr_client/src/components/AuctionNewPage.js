import React, { Component } from "react";

import { Auction } from "../api/auction";

export class AuctionNewPage extends Component {
  constructor(props) {
    super(props);
    this.state = {
      new_auction: null,
      errors: [],
      noError: true
    };
  }

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
      else {
        console.log(data.errors);
        this.setState({new_auction: this.new_auction, errors: data.errors, noError: null});
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
        <h1>Create An Auction</h1>
        {!this.state.noError && (this.state.errors.map(err => (
            <p>{err}</p>
          )))}
        <div className="field">
          <label htmlFor="title">Title*</label>
          <input type="text" name="title" id="title" defaultValue={this.state.new_auction ? `${this.state.new_auction.title}` : ""} required />
        </div>
        <div className="field">
          <label htmlFor="description">Description*</label>
          <textarea name="description" id="description" rows="3" defaultValue={this.state.new_auction ? `${this.state.new_auction.description}` : ""} required />
        </div>
        <div className="field">
          <label htmlFor="ends_at">Ends at*</label>
          <input type="text" name="ends_at" id="ends_at" defaultValue={this.state.new_auction ? `${this.state.new_auction.ends_at}` : ""} required />
        </div>
        <div className="field">
          <label htmlFor="reserve_price">Reserve Price*</label>
          <input type="text" name="reserve_price" id="reserve_price" defaultValue={this.state.new_auction ? `${this.state.new_auction.reserve_price}` : ""} required />
        </div>
        <button className="ui orange button" type="submit">
          Save
        </button>
      </form>
    );
  }
}