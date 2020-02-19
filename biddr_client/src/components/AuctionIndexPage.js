import React, { Component } from "react";
import { Link } from "react-router-dom";

import { Auction } from "../api/auction";
import { Spinner } from "./Spinner";

export class AuctionIndexPage extends Component {
  constructor(props) {
    super(props);

    this.state = {
      auctions: [],
      isLoading: true
    };
  }

  componentDidMount() {
    Auction.all().then(auctions => {
      this.setState({ auctions, isLoading: false });
    });
  }

  render() {
    if (this.state.isLoading) {
      return <Spinner message="Wait to load the list of auctions" />;
    }
    return (
      <main>
        <h2 className="ui horizontal divider header">Auctions</h2>
        <ul className="ui list">
          {this.state.auctions.map(auction => (
            <li className="item" key={auction.id}>
              <Link
                to={`/auctions/${auction.id}`}
                className="ui link"
                href=""
              >
                {auction.title}
              </Link>
              <p>posted on {new Date(auction.created_at).toLocaleDateString()}</p>
            </li>
          ))}
        </ul>
      </main>
    );
  }
};
