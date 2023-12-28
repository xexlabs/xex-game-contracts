Overview: This document outlines the contracts required for the XEX in-game rewards.

Contract Flow: The user initiates a contract call before playing the game. This contract call creates a single XEX mint with a variable term date and requires the user to pay for gas. The contract mints XEX associated with the wallet and waits for the game's result to allow the user to claim. The potential results:


User Completes the Game Successfully
User Loses the Game
Character Dies
The time limit is reached

Success: If the user completes the game successfully, they can claim their initial XEX mint after their term date is reached, PLUS additional XEX distributed via a RewardsPool contract. This additional amount of XEX is an adjustable number after deployment that is given per completion for any user. This amount of XEX is given to their user using the ‘Claim’ contract built into XEX minting and is paid by the user.

Failure: If the user fails to complete the game by dying OR by reaching the time limit, they can claim 20% of their initial XEX mint. This percentage should be adjustable after deployment. The Remaining percent of their initial XEX mint (80%) should be sent to the RewardsPool contract. This amount of XEX is given to their user, and the XEX is sent to the RewardsPool, using the ‘Claim’ contract built into XEX minting, and is paid by the user.

Example #1: The user begins a dungeon by paying gas for an XEX mint with a 1-day term date. They complete the dungeon in 5 minutes. The contract allows the user to claim their XEX mint with additional rewards from RewardsPool in a single transaction, 24 hours after they initiated their XEX Mint. If they claim later, they are subject to the decaying rewards on the XEX mint, but still receive the same additional rewards from RewardsPool.

Example #2: The user begins a dungeon by paying gas for an XEX mint with a 1-day term date. They fail to complete the dungeon and die after playing for 10 minutes. The contract allows the user to claim 20% of their XEX mint in a single transaction, 24 hours after they initiated their XEX Mint. The remaining 80% of their mint will be sent to RewardsPool when the user calls the Claim transaction.
