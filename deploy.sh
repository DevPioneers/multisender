#!/bin/sh
export STARKNET_RPC="https://starknet-goerli.infura.io/v3/"
export STARKNET_KEYSTORE="~/.starkli-wallets/deployer/key.json"
export STARKNET_ACCOUNT="~/.starkli-wallets/deployer/account.json"
starkli deploy --watch 0x04a5ff2ca19df18ea09f9e679eababbe33efcc29b40ce530b7edcacd63985a55 



