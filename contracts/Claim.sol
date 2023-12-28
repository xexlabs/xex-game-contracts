// SPDX-License-Identifier: MIT
pragma solidity =0.8.23;

contract Claim {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function claimReward(uint256 _reward) public {
        require(msg.sender == owner, "Only the contract owner can claim rewards");
        // Transfer the reward to the owner
        msg.sender.transfer(_reward);
    }

    function setOwner(address _newOwner) public {
        require(msg.sender == owner, "Only the contract owner can set a new owner");
        owner = _newOwner;
    }
}

