import { HardhatUserConfig } from 'hardhat/config'
import '@nomicfoundation/hardhat-toolbox'
import dotenv from 'dotenv'
dotenv.config()
const config: HardhatUserConfig = {
	solidity: {
		compilers: [
			{
				version: '0.8.23',
				settings: {
					optimizer: {
						enabled: true,
						runs: 200
					}
				}
			}
		]
	},
	networks: {
		bsc: {
			url: `https://rpc.ankr.com/bsc/${process.env.ANKR}`,
			accounts: [`${process.env.PRIVATE_KEY}`]
		},
		avax: {
			url: `https://rpc.ankr.com/avalanche/${process.env.ANKR}`,
			accounts: [`${process.env.PRIVATE_KEY}`]
		},
		polygon: {
			url: `https://rpc.ankr.com/polygon/${process.env.ANKR}`,
			accounts: [`${process.env.PRIVATE_KEY}`]
		},
		ftm: {
			url: `https://rpc.ankr.com/fantom/${process.env.ANKR}`,
			accounts: [`${process.env.PRIVATE_KEY}`]
		},
		eth: {
			url: `https://mainnet.infura.io/v3/${process.env.INFURA}`,
			accounts: [`${process.env.PRIVATE_KEY}`]
		},
		arb: {
			url: `https://arb1.arbitrum.io/rpc`,
			accounts: [`${process.env.PRIVATE_KEY}`]
		},

		goerli: {
			url: `https://goerli.infura.io/v3/${process.env.INFURA}`,
			accounts: [`${process.env.PRIVATE_KEY}`]
		},
		bsc_testnet: {
			url: `https://bsc-testnet.public.blastapi.io`,
			accounts: [`${process.env.PRIVATE_KEY}`]
		},
		avax_testnet: {
			url: `https://api.avax-test.network/ext/bc/C/rpc`,
			accounts: [`${process.env.PRIVATE_KEY}`]
		},
		polygon_testnet: {
			url: `https://rpc.ankr.com/polygon_mumbai`,
			accounts: [`${process.env.PRIVATE_KEY}`]
		},
		ftm_testnet: {
			url: `https://rpc.ankr.com/fantom_testnet`,
			accounts: [`${process.env.PRIVATE_KEY}`]
		}
	},
	etherscan: {
		apiKey: {
			// npx hardhat verify --list-networks
			goerli: `${process.env.ETHERSCAN}`,
			mainnet: `${process.env.ETHERSCAN}`,
			canto_testnet: `test`,
			bsc: `${process.env.BSCSCAN}`,
			bscTestnet: `${process.env.BSCSCAN}`,
			avalanche: `${process.env.SNOWTRACE}`,
			avalancheFujiTestnet: `${process.env.SNOWTRACE}`,
			polygon: `${process.env.POLYGONSCAN}`,
			polygonMumbai: `${process.env.POLYGONSCAN}`,
			ftmTestnet: `${process.env.FTMSCAN}`,
			opera: `${process.env.FTMSCAN}`,
			arbitrumOne: `${process.env.ARBSCAN}`
		},
		customChains: [
			{
				network: 'canto_testnet',
				chainId: 740,
				urls: {
					apiURL: 'https://evm.explorer.canto-testnet.com/api',
					browserURL: 'https://eth.plexnode.wtf/'
				}
			}
		]
	}
}

export default config
