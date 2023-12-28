// SPDX-License-Identifier: MIT
pragma solidity =0.8.23;

import "./Game.sol";

contract User {
    address public owner;
    Game public game;
    uint256 public mintAmount;
    uint256 public termDate;
    uint256 public timeLimit;

    constructor(address _game) public {
        owner = msg.sender;
        game = Game(_game);
    }

    function startGame(uint256 _mintAmount, uint256 _termDate, uint256 _timeLimit) public payable {
        mintAmount = _mintAmount;
        termDate = _termDate;
        timeLimit = _timeLimit;
        game.startGame(mintAmount, termDate, timeLimit);
    }

    function completeGame() public {
        require(msg.sender == owner, "Only the contract owner can complete the game");
        game.completeGame();
    }

    function failGame() public {
        require(msg.sender == owner, "Only the contract owner can fail the game");
        game.failGame();
    }

    function claimReward() public {
        game.claimReward();
    }

    function setTimeLimit(uint256 _timeLimit) public {
        require(msg.sender == owner, "Only the contract owner can set the time limit");
        timeLimit = _timeLimit;
        game.setTimeLimit(timeLimit);
    }
}

