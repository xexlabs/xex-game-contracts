// SPDX-License-Identifier: MIT
pragma solidity =0.8.23;

contract RewardsPool {
    address public owner;
    uint256 public totalRewards;

    constructor() {
        owner = msg.sender;
    }

    function addReward(uint256 _reward) public {
        require(msg.sender == owner, "Only the contract owner can add rewards");
        totalRewards += _reward;
    }

    function getReward() public returns (uint256) {
        require(msg.sender == owner, "Only the contract owner can get rewards");
        uint256 reward = totalRewards;
        totalRewards = 0;
        return reward;
    }

    function setOwner(address _newOwner) public {
        require(msg.sender == owner, "Only the contract owner can set a new owner");
        owner = _newOwner;
    }
}

