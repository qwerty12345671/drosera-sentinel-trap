

Drosera Sentinel Trap

Drosera Sentinel Trap is an experimental Solidity smart contract designed to integrate with the Drosera decentralized automation framework. Acting as a sentinel, this trap monitors blockchain events and automatically responds when specified conditions are met.

Features
	•	Automated Responses: Responds to triggers on-chain without manual intervention.
	•	Whitelisted Access: Only authorized addresses can trigger the trap.
	•	Cooldown Mechanism: Prevents spamming by enforcing a cooldown period between triggers.
	•	Multi-Operator Support: Configurable minimum and maximum number of operators for activation.
	•	Secure & Transparent: All logic and responses are visible on-chain.

Contracts
	•	SentinelTrap.sol – The main contract implementing the trap logic.
	•	SimpleTrap.sol – A basic example trap demonstrating Drosera functionality.

Deployment

Deployed on Hoodi Testnet:
	•	SentinelTrap Address: 0x48C396B149b2aF18D1711c8A716Dff627ab251cC
	•	SimpleTrap Address: 0x8eb2f4909448951D7Eaa123fa8f15618764e73cD

Deployment was done using Foundry, via the Deploy.s.sol script in the script/ folder.

Usage
	1.	Set your environment variables:

export RPC_URL="https://ethereum-hoodi-rpc.publicnode.com"
export PRIVATE_KEY="0xYOUR_DEPLOYER_PRIVATE_KEY"
export DROSERA_PRIVATE_KEY="0xYOUR_DROSERA_PRIVATE_KEY"
export OPERATOR_ADDRESS="0xYOUR_OPERATOR_ADDRESS"

	2.	Deploy or interact with the trap:

forge script script/Deploy.s.sol:Deploy --rpc-url $RPC_URL --private-key $PRIVATE_KEY --broadcast
cast call 0x48C396B149b2aF18D1711c8A716Dff627ab251cC "collect()" --rpc-url $RPC_URL

Configuration

The trap is configured in drosera.toml:

[traps.sentineltrap]
path = "out/SentinelTrap.sol/SentinelTrap.json"
response_contract = "0x48C396B149b2aF18D1711c8A716Dff627ab251cC"
response_function = "collect()"
cooldown_period_blocks = 32
min_number_of_operators = 1
max_number_of_operators = 2
block_sample_size = 1
private_trap = true
whitelist = ["0x74fb4776f4261412f9438dd313d05340fa14da1d"]
address = "0x48C396B149b2aF18D1711c8A716Dff627ab251cC"

Contributing

Contributions and improvements are welcome. Please open issues or pull requests for enhancements, bug fixes, or new trap ideas.

License

This project is licensed under the MIT License
