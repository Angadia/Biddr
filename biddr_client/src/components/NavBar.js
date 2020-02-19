import React from "react";
import { NavLink } from "react-router-dom";

export const NavBar = ({ currentUser, onSignOut }) => {
  const handleSignOutClick = event => {
    event.preventDefault();
    if (typeof onSignOut === "function") {
      onSignOut();
    }
  };
  return (
    
    <div className="ui secondary pointing menu">
      <NavLink exact to="/" className="item">
        Biddr
      </NavLink>
      <div className="ui secondary pointing right menu">
        <NavLink exact to="/" className="item">
          Home
        </NavLink>
        <NavLink exact to="/auctions" className="item">
          Auctions
        </NavLink>
        {!currentUser && (
          <>
            <NavLink exact to="/sign_in" className="item">
              Sign In
            </NavLink>
          </>
        )}
        {currentUser && (
          <>
            <NavLink exact to="/auctions/new" className="item">
              Auction
            </NavLink>
            <div className="item">{currentUser.full_name}</div>
            <a
              href=""
              className="item"
              onClick={handleSignOutClick}
            >
              Sign Out
            </a>
          </>
        )}
      </div>
    </div>
  );
};