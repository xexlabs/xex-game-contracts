// SPDX-License-Identifier: MIT
pragma solidity =0.8.23;

contract Character {
    address public owner;
    bool public isAlive = true;

    constructor() {
        owner = msg.sender;
    }

    function die() public {
        require(msg.sender == owner, "Only the contract owner can kill the character");
        isAlive = false;
    }

    function revive() public {
        require(msg.sender == owner, "Only the contract owner can revive the character");
        isAlive = true;
    }

    function checkStatus() public view returns(bool) {
        return isAlive;
    }
}

