# Network & Contracts Overview

-   Network: Goerli
-   Game address: 0xac1fA63d403Ca8495118Ad8430cB24ea43057fc2
-   NFT address: 0xb6c84B7b555cE1f799cE6e82D9BcF28a699597C9
-   Reward Token address: 0xE62a817704088493EF68a8C894040a44B79953D0

# Overview About Contracts Usage

The Game contract is designed to manage in-game rewards for players.

t allows players to start a game session, end it based on the game's outcome, and claim rewards.

Below is a guide on how to interact with the Game contract, including the available functions (ABI), their parameters, and the data structures they return.

# Game Operations

# Object Info

```solidity
struct Dungeon {
	string name; // The name of the dungeon
	uint startIn; // The start time of the dungeon
	uint endIn; // The end time of the dungeon
	uint minTermDate; // The minimum term date of the dungeon
	uint maxTermDate; // The maximum term date of the dungeon
	uint minMintFee; // The minimum mint fee of the dungeon
	uint failurePercentage; // The failure percentage of the dungeon
	bool active; // The status of the dungeon
	uint availableRewards; // The available rewards of the dungeon
	uint claimedRewards; // The claimed rewards of the dungeon
}
```

```solidity
struct Session {
	address user; // The address of the user
	uint tokenId; // The token id of the user
	uint feeDeposited; // The fee deposited by the user
	uint rewardAmount; // the amount of reward the user will get if completed
	bool gameCompleted; // the status of the game
	uint dungeonId; // the dungeon id of the game
	uint startedAt; // the time when the game started
	uint endedAt; // the time when the game ended
	uint claimAmount; // the amount of reward the user will got if completed
	uint claimAt; // the time when the user can claim the reward
	uint availableRewards; // not used
	uint claimedRewards; // not used
}
```

## Contract Functions

`Game.getOnlyActiveDungeons()`
return: uint[]

Use to get the list of only active dungeons that can be used by the palyer to play games.

`Game.getActiveSessions(uint dungeonId)`
return: uint[]

Use to get the list of active sessions for a given dungeon.
Sessions are active gameplays going on for a given dungeon.

`Game.getActiveSessionsByUser(address user)`
return: uint[]

Use to get the list of active sessions for a given user.
It means the user is currently playing the game.

`Game.getFinishedSessions(uint dungeonId)`
return: uint[]

Use to get the list of finished sessions for a given dungeon.
Sessions are finished gameplays for a given dungeon.

`Game.getFinishedSessionsByUser(address user)`
return: uint[]

Use to get the list of finished sessions for a given user.
It means the user has finished playing the game.

`Game.getDungeonInfo(uint dungeonId)`
return: (struct Dungeon)

Get information about an dungeon.
See info Dungeon above.

`Game.getSession(uint sessionId)`
return: (struct Session)

Get information about a game session.
See info Session above.

`Game.start(uint dungeonId)`

Allow user to start a game session for a given dungeon.

`Game.claim(uint sessionId)`

Allow user to claim the nft and reward for a given session.

After the game is finished.

`Game.end(uint sessionId)`

Allow admin to end a game session.

# Admin Operations

`Game.addReward(uint dungeonId, uint amount)`

Used to add reward tokens to the contract.

For testing purpose, the reward token is `Reward Token address` above.

`Game.addDungeon(
    string memory _name,
    uint _startIn,
    uint _endIn,
    uint _minMintFee,
    uint _minTermDate,
    uint _maxTermDate,
    uint _failurePercentage,
    uint _rewardAmount)`

Use to add a new dungeon to the contract.

`Game.removeDungeon(uint dungeonId)`

Use to remove/dsable an dungeon.

`Game.setDungeonStatus(uint dungeonId, bool status)`
Use to enable/disable a dungeon.

`Game.setMinMintFee(uint dungeonId, uint minMintFee)`
Use to set any ETH mint fee for a dungeon, used when user start the game.

`Game.setRewardPercentage(uint dungeonId, uint failurePercentage)`

Use to set the reward paid on the completion of the game for failed games.
