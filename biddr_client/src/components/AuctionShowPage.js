import React, { Component } from "react";

import "./css/AuctionShowPage.css";
import { AuctionDetails } from "./AuctionDetails";
import { BidList } from "./BidList";
import { Auction } from "../api/auction";
import { Spinner } from "./Spinner";
import { Bid } from "../api/bid";

export class AuctionShowPage extends Component {
  constructor(props) {
    super(props);
    this.state = {
      auction: null,
      errors: [],
      noError: true,
      isLoading: true
    };
  }

  componentDidMount() {
    Auction.one(this.props.match.params.id).then(auction => {
      this.setState({ auction, isLoading: false });
    });
  }

  createBid = event => {
    event.preventDefault();
    const { currentTarget } = event;
    const fd = new FormData(currentTarget);

    const newBid = {
      bid_amount: fd.get("new_bid_amount"),
      auction_id: this.state.auction.id
    };

    Bid.create(newBid).then(data => {
      if (!data.errors) {
        Auction.one(this.props.match.params.id).then(auction => {
          this.setState({ auction, errors: [], noError: true, isLoading: false });
        });
      }
      else {
        this.setState({errors: data.errors, noError: null});
      }
    });

    currentTarget.reset();
  };
  render() {
    if (this.state.isLoading) {
      return <Spinner message="Loading Auction Details..." />;
    }
    return (
      <div className="Page">
        <AuctionDetails {...this.state.auction} />
        <form
        className="NewBidForm ui form"
        onSubmit={event => this.createBid(event)}
        >
          {!this.state.noError && (this.state.errors.map(err => (
            <p>{err}</p>
          )))}
          <div className="field">
            <input type="text" name="new_bid_amount" id="new_bid_amount" required />
          </div>
          <button className="ui orange button" type="submit">
            Bid
          </button>
        </form>
        <BidList bids={this.state.auction.bids} />
      </div>
    );
  }
};
