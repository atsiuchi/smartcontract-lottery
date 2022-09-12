// SPDX-License-Identifier: MIT

pragma solidity ^0.6.6;

import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";

contract Lottery {
    address payable[] public players;
    uint256 public usdEntryFee;
    AggregatorV3Interface internal ethUsdPriceFeed;

    constructor(address _priceFeedAddress) public {
        usdEntryFee = 50 * (10**18);
        ethUsdPriceFeed = AggregatorV3Interface(_priceFeedAddress);
    }

    function enter() public payable {
        players.push(msg.sender);
    }

    function getEntranceFee() public view returns (uint256) {
        uint256 price = 1750;
        uint256 adjustedPrice = 1750 ; // 18 decimals

        uint256 costToEnter = usdEntryFee  / adjustedPrice;
  
        return costToEnter ;
    }
}
