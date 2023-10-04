// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Auction {
    address public highestBidder;
    uint256 public highestBid;
    uint256 public auctionEndBlock;
    bool public auctionEnded;

    constructor(uint256 _biddingTimeInBlocks) {
        auctionEndBlock = block.number + _biddingTimeInBlocks;
        auctionEnded = false;
    }

    function bid() public payable {
        require(!auctionEnded, "Auction has ended.");
        require(block.number < auctionEndBlock, "Auction has ended.");

        require(msg.value > highestBid, "There is already a higher bid.");

        highestBidder = msg.sender;
        highestBid = msg.value;
    }

    function endAuction() public {
        require(!auctionEnded, "Auction has already ended.");
        require(block.number >= auctionEndBlock, "Auction has not ended yet.");
        require(msg.sender == highestBidder, "You are not the highest bidder.");

        auctionEnded = true;

        // Transfer the item to the highest bidder
        // ...

        selfdestruct(payable(owner()));
    }
}
