import { ethers } from 'hardhat'

const fs = require('fs')
async function main() {
	const depositAmount = ethers.parseEther('100')
	const [owner] = await ethers.getSigners()
	const balance = await ethers.provider.getBalance(owner.address)

	const balanceEth = parseFloat(ethers.formatEther(balance))
	if (balanceEth < 0.1) {
		throw new Error('Insufficient balance')
	}
	console.log('Deploying contracts with the account:', owner.address, 'balance:', balanceEth)
	const NFT = await ethers.getContractFactory('NFT')
	const MockERC20 = await ethers.getContractFactory('MockERC20')
	const Game = await ethers.getContractFactory('Game')

	const rewardToken = await MockERC20.deploy('Reward Token', 'RWD', 18)
	const nft = await NFT.deploy()
	const game = await Game.deploy(nft.target, owner.address, rewardToken.target)

	const gameAddress = game.target
	const nftAddress = nft.target
	const rewardTokenAddress = rewardToken.target
	console.log('Game address:', gameAddress)
	console.log('NFT address:', nftAddress)
	console.log('Reward Token address:', rewardTokenAddress)

	const config = {
		gameAddress,
		nftAddress,
		rewardTokenAddress,
		depositAmount: depositAmount.toString()
	}

	fs.writeFileSync('config.json', JSON.stringify(config, null, 2))

	try {
		const MINTER_ROLE = await nft.MINTER_ROLE()
		await nft.grantRole(MINTER_ROLE, game.target)
	} catch (e) {
		console.log('Error granting role')
		console.log(e.message)
	}

	// only verify if not on hardhat:
	const network = await ethers.provider.getNetwork()
	const networkId = network.chainId
	const isHardhat = networkId === 31337n
	if (!isHardhat) {
		await hre.run('verify:verify', {
			address: gameAddress,
			constructorArguments: [nftAddress, owner.address, rewardTokenAddress]
		})
		await hre.run('verify:verify', {
			address: nftAddress,
			constructorArguments: []
		})
		await hre.run('verify:verify', {
			address: rewardTokenAddress,
			constructorArguments: ['Reward Token', 'RWD', 18]
		})
	}
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch(error => {
	console.error(error)
	process.exitCode = 1
})
