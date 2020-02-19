import React, { Component } from "react";
import { BrowserRouter, Route, Switch } from "react-router-dom";

import { NavBar } from "./NavBar";
import { User } from "../api/user";
import { Session } from "../api/session";
import { Spinner } from "./Spinner";
import { WelcomePage } from "./WelcomePage";
import { SignInPage } from "./SignInPage";
import { AuctionShowPage } from "./AuctionShowPage";
import { AuctionIndexPage } from "./AuctionIndexPage";
import { AuctionNewPage } from "./AuctionNewPage";
import { AuthRoute } from "./AuthRoute";


class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      currentUser: null,
      isLoading: true
    };

    this.getUser = this.getUser.bind(this);
    this.destroySession = this.destroySession.bind(this);
  }

  getUser() {
    User.current().then(data => {
      if (typeof data.id !== "number") {
        this.setState({ currentUser: null, isLoading: false });
      } else {
        this.setState({ currentUser: data, isLoading: false });
      }
    });
  }

  destroySession() {
    Session.destroy().then(this.setState({ currentUser: null }));
  }

  componentDidMount() {
    this.getUser();
  }
  render() {
    if (this.state.isLoading) {
      return <Spinner message="Logged in user is being authenticated" />;
    }
    return (
      <BrowserRouter>
        <header>
          <NavBar
            currentUser={this.state.currentUser}
            onSignOut={this.destroySession}
          />
        </header>
        <div className="ui container segment">
          <Switch>
            <Route exact path="/" component={WelcomePage} />
            <Route exact path="/auctions" component={AuctionIndexPage} />
            <AuthRoute
              isAuthenticated={!!this.state.currentUser}
              component={AuctionNewPage}
              path="/auctions/new"
              exact
            />
            <AuthRoute
              isAuthenticated={!!this.state.currentUser}
              component={AuctionShowPage}
              path="/auctions/:id"
              exact
            />
            <Route
              path="/sign_in"
              render={routeProps => (
                <SignInPage {...routeProps} onSignIn={this.getUser} />
              )}
            />
          </Switch>
        </div>
      </BrowserRouter>
    );
  }
}

export default App;
