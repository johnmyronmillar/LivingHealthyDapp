pragma solidity ^0.6.0;

contract HealthAuction {
    address payable public beneficiary;

    // Current state of the auction.
    address public highestBetter;
    uint public highestBet;

    // Allowed withdrawals of previous Bets
    mapping(address => uint) pendingReturns;

    // Set to true at the end, disallows any change.
    // By default initialized to `false`.
    bool public ended;

    // Events that will be emitted on changes.
    event HighestBetIncreased(address Better, uint amount);
    event AuctionEnded(address winner, uint amount);

    // The following is a so-called natspec comment,
    // recognizable by the three slashes.
    // It will be shown when the user is asked to
    // confirm a transaction.

    /// Create a simple auction with `_BetdingTime`
    /// seconds Betding time on behalf of the
    /// beneficiary address `_beneficiary`.
    constructor(
        address payable _beneficiary
    ) public {
        beneficiary = _beneficiary;
    }

    /// Bet on the auction with the value sent
    /// together with this transaction.
    /// The value will only be refunded if the
    /// auction is not won.
    function Bet(address payable sender) public payable {
        // If the Bet is not higher, send the
        // money back.
        require(
            msg.value > highestBet,
            "There already is a higher Bet."
        );

        require(!ended, "auctionEnd has already been called.");

        if (highestBet != 0) {
            // Sending back the money by simply using
            // highestBetter.send(highestBet) is a security risk
            // because it could execute an untrusted contract.
            // It is always safer to let the recipients
            // withdraw their money themselves.
            pendingReturns[highestBetter] += highestBet;
        }
        highestBetter = sender;
        highestBet = msg.value;
        emit HighestBetIncreased(sender, msg.value);
    }

    /// Withdraw a Bet that was overBet.
    function withdraw() public returns (bool) {
        uint amount = pendingReturns[msg.sender];
        if (amount > 0) {
            // It is important to set this to zero because the recipient
            // can call this function again as part of the receiving call
            // before `send` returns.
            pendingReturns[msg.sender] = 0;

            if (!msg.sender.send(amount)) {
                // No need to call throw here, just reset the amount owing
                pendingReturns[msg.sender] = amount;
                return false;
            }
        }
        return true;
    }

    function pendingReturn(address sender) public view returns (uint) {
        return pendingReturns[sender];
    }

    /// End the auction and send the highest Bet
    /// to the beneficiary.
    function auctionEnd() public {
        // It is a good guideline to structure functions that interact
        // with other contracts (i.e. they call functions or send Ether)
        // into three phases:
        // 1. checking conditions
        // 2. performing actions (potentially changing conditions)
        // 3. interacting with other contracts
        // If these phases are mixed up, the other contract could call
        // back into the current contract and modify the state or cause
        // effects (ether payout) to be performed multiple times.
        // If functions called internally include interaction with external
        // contracts, they also have to be considered interaction with
        // external contracts.

        // 1. Conditions
        require(!ended, "auctionEnd has already been called.");

        // 2. Effects
        ended = true;
        emit AuctionEnded(highestBetter, highestBet);

        // 3. Interaction
        beneficiary.transfer(highestBet);
    }
}
