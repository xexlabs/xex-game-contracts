// SPDX-License-Identifier: MIT
pragma solidity =0.8.23;

contract TimeLimit {
    address public owner;
    uint256 public timeLimit;

    constructor() {
        owner = msg.sender;
    }

    function setTimeLimit(uint256 _timeLimit) public {
        require(msg.sender == owner, "Only the contract owner can set the time limit");
        timeLimit = _timeLimit;
    }

    function getTimeLimit() public view returns (uint256) {
        return timeLimit;
    }

    function checkTimeLimit() public view returns (bool) {
        if (block.timestamp > timeLimit) {
            return false;
        } else {
            return true;
        }
    }
}

