// SPDX-License-Identifier: MIT
pragma solidity =0.8.23;

import "./XEXMint.sol";

contract Game {
    address public owner;
    XEXMint public xexMint;
    bool public gameCompleted = false;
    uint256 public timeLimit;

    constructor(address _xexMint) public {
        owner = msg.sender;
        xexMint = XEXMint(_xexMint);
    }

    function startGame(uint256 _mintAmount, uint256 _termDate, uint256 _timeLimit) public payable {
        xexMint.initiateContract(_mintAmount, _termDate);
        timeLimit = _timeLimit;
    }

    function completeGame() public {
        require(msg.sender == owner, "Only the contract owner can complete the game");
        require(block.timestamp <= timeLimit, "Time limit has been reached");
        gameCompleted = true;
        xexMint.setGameResult(gameCompleted);
    }

    function failGame() public {
        require(msg.sender == owner, "Only the contract owner can fail the game");
        gameCompleted = false;
        xexMint.setGameResult(gameCompleted);
    }

    function claimReward() public {
        xexMint.claimReward();
    }

    function setTimeLimit(uint256 _timeLimit) public {
        require(msg.sender == owner, "Only the contract owner can set the time limit");
        timeLimit = _timeLimit;
    }
}

