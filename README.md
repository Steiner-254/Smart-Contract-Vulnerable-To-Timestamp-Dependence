# Smart-Contract-Vulnerable-To-Timestamp-Dependence
Smart Contract Vulnerable To Timestamp Dependence

# Description
~ A smart contract vulnerable to Timestamp Dependence is one that relies on the timestamp provided by the blockchain for its functionality, but can be exploited if an attacker manipulates the timestamp or if the timestamp is not as secure as assumed.

# vulnerable.sol
~ In vulnerable.sol, we have an auction smart contract that allows users to place bids within a specified bidding time. The contract uses block.timestamp to track the end time of the auction and restricts bids once the auction has ended.

~ However, this contract is vulnerable to Timestamp Dependence because an attacker can manipulate the contract's behavior by mining or submitting transactions with manipulated timestamps. For example, an attacker could submit a transaction with a manipulated timestamp that sets block.timestamp to a value earlier than the actual current time, effectively extending the auction time or allowing them to place bids after the auction should have ended.

# fix.sol
~ In this fix.sol contract:

1. We use block.number to track the end block of the auction (auctionEndBlock) instead of relying on block.timestamp.

2. We introduce a bool variable auctionEnded to keep track of whether the auction has ended or not.

3. The bid function checks both auctionEnded and block.number to determine if the auction is still active.

4. The endAuction function checks if the auction has already ended (auctionEnded) and ensures that the current block number is greater than or equal to the auctionEndBlock.

5. This modified contract is less vulnerable to timestamp manipulation because it relies on block numbers, which are more secure and tamper-resistant compared to timestamps.
