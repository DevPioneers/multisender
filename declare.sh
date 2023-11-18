#!/bin/sh
scarb build
export STARKNET_RPC="https://starknet-goerli.infura.io/v3/"
export STARKNET_KEYSTORE="~/.starkli-wallets/deployer/key.json"
export STARKNET_ACCOUNT="~/.starkli-wallets/deployer/account.json"
starkli declare --watch ./target/dev/multi_sender_SonicForceDisperse.sierra.json --account "~/.starkli-wallets/deployer/account.json"

