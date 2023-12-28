// SPDX-License-Identifier: MIT
pragma solidity =0.8.23;

import "./XEXMint.sol";
import "./Game.sol";

contract AdjustableValues {
    address public owner;
    XEXMint public xexMint;
    Game public game;

    constructor(address _xexMint, address _game) public {
        owner = msg.sender;
        xexMint = XEXMint(_xexMint);
        game = Game(_game);
    }

    function setFailurePercentage(uint256 _failurePercentage) public {
        require(msg.sender == owner, "Only the contract owner can set the failure percentage");
        xexMint.setFailurePercentage(_failurePercentage);
    }

    function setTimeLimit(uint256 _timeLimit) public {
        require(msg.sender == owner, "Only the contract owner can set the time limit");
        game.setTimeLimit(_timeLimit);
    }

    function setOwner(address _newOwner) public {
        require(msg.sender == owner, "Only the contract owner can set a new owner");
        owner = _newOwner;
    }
}

