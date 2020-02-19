import React, { Component } from "react";

import "./css/AuctionShowPage.css";
import { AuctionDetails } from "./AuctionDetails";
import { BidList } from "./BidList";
import { Auction } from "../api/auction";
import { Spinner } from "./Spinner";

export class AuctionShowPage extends Component {
  constructor(props) {
    super(props);
    this.state = {
      auction: null,
      isLoading: true
    };
  }

  componentDidMount() {
    Auction.one(this.props.match.params.id).then(auction => {
      this.setState({ auction, isLoading: false });
    });
  }

  render() {
    if (this.state.isLoading) {
      return <Spinner message="Loading Auction Details..." />;
    }
    return (
      <div className="Page">
        <AuctionDetails {...this.state.auction} />
        <BidList bids={this.state.auction.bids} />
      </div>
    );
  }
};
