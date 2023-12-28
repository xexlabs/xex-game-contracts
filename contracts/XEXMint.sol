// SPDX-License-Identifier: MIT
pragma solidity =0.8.23;

import "./RewardsPool.sol";
import "./Claim.sol";

contract XEXMint {
    address public owner;
    uint256 public termDate;
    uint256 public mintAmount;
    uint256 public rewardAmount;
    uint256 public failurePercentage = 20;
    bool public gameCompleted = false;
    RewardsPool rewardsPool;
    Claim claim;

    constructor(address _rewardsPool, address _claim) {
        owner = msg.sender;
        rewardsPool = RewardsPool(_rewardsPool);
        claim = Claim(_claim);
    }

    function initiateContract(uint256 _mintAmount, uint256 _termDate) public payable {
        require(msg.value > 0, "Gas fee is required");
        mintAmount = _mintAmount;
        termDate = _termDate;
    }

    function setGameResult(bool _gameCompleted) public {
        require(msg.sender == owner, "Only the contract owner can set the game result");
        gameCompleted = _gameCompleted;
    }

    function claimReward() public {
        require(block.timestamp >= termDate, "Term date has not been reached");
        if (gameCompleted) {
            uint256 totalReward = mintAmount + rewardsPool.getReward();
            claim.claimReward(totalReward);
        } else {
            uint256 userReward = (mintAmount * failurePercentage) / 100;
            uint256 poolReward = mintAmount - userReward;
            rewardsPool.addReward(poolReward);
            claim.claimReward(userReward);
        }
    }

    function setFailurePercentage(uint256 _failurePercentage) public {
        require(msg.sender == owner, "Only the contract owner can set the failure percentage");
        failurePercentage = _failurePercentage;
    }
}

