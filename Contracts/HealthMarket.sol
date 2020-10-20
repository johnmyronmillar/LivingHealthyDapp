pragma solidity ^0.6.0;

import '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import '@openzeppelin/contracts/access/Ownable.sol';
import './HealthAuction.sol';

contract HealthMarket is ERC721, Ownable {
    constructor() ERC721("HealthMarket", "MARS") public {}

    address payable foundationAddress = msg.sender;

    mapping(uint => HealthAuction) public auctions;

    function registerLand(string memory tokenURI) public payable onlyOwner {
        uint _id = totalSupply();
        _mint(msg.sender, _id);
        _setTokenURI(_id, tokenURI);
        createAuction(_id);
    }

    function createAuction(uint tokenId) public onlyOwner {
        auctions[tokenId] = new HealthAuction(foundationAddress);
    }

    function endAuction(uint tokenId) public onlyOwner {
        require(_exists(tokenId), "Land not registered!");
        HealthAuction auction = getAuction(tokenId);
        auction.auctionEnd();
        safeTransferFrom(owner(), auction.highestBetter(), tokenId);
    }

    function getAuction(uint tokenId) public view returns(HealthAuction auction) {
        return auctions[tokenId];
    }

    function auctionEnded(uint tokenId) public view returns(bool) {
        require(_exists(tokenId), "Land not registered!");
        HealthAuction auction = getAuction(tokenId);
        return auction.ended();
    }

    function highestBet(uint tokenId) public view returns(uint) {
        require(_exists(tokenId), "Land not registered!");
        HealthAuction auction = getAuction(tokenId);
        return auction.highestBet();
    }

    function pendingReturn(uint tokenId, address sender) public view returns(uint) {
        require(_exists(tokenId), "Land not registered!");
        HealthAuction auction = getAuction(tokenId);
        return auction.pendingReturn(sender);
    }

    function Bet(uint tokenId) public payable {
        require(_exists(tokenId), "Land not registered!");
        HealthAuction auction = getAuction(tokenId);
        auction.Bet.value(msg.value)(msg.sender);
    }

}
