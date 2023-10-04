// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Auction {
    address public highestBidder;
    uint256 public highestBid;
    uint256 public auctionEndTime;

    constructor(uint256 _biddingTime) {
        auctionEndTime = block.timestamp + _biddingTime;
    }

    function bid() public payable {
        require(block.timestamp < auctionEndTime, "Auction has ended.");
        require(msg.value > highestBid, "There is already a higher bid.");

        highestBidder = msg.sender;
        highestBid = msg.value;
    }

    function endAuction() public {
        require(block.timestamp >= auctionEndTime, "Auction has not ended yet.");
        require(msg.sender == highestBidder, "You are not the highest bidder.");

        // Transfer the item to the highest bidder
        // ...

        selfdestruct(payable(owner()));
    }
}
