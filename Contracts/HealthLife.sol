pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Mintable.sol";

contract HealthLifeCoin is ERC20Mintable {
    string public name = "HEALTH LIFE COIN";
    string public symbol = "HLC";
    uint8 public decimals = 18;
}
