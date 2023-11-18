#!/bin/sh
# scarb build
# export STARKNET_RPC="https://starknet-goerli.infura.io/v3/8eb7d215d441492aad3c381f0b22c850"
export STARKNET_RPC="https://starknet-goerli.g.alchemy.com/v2/a0GzwHJlvv3YMBPET_t82vz_LbQgP25F"
export STARKNET_KEYSTORE="~/.starkli-wallets/deployer/key-1.json"
export STARKNET_ACCOUNT="~/.starkli-wallets/deployer/account-1.json"
# starkli declare --watch ./target/dev/sonic_force_disperse_SonicForceDisperse.contract_class.json
starkli declare --watch target/dev/sonic_force_disperse.sierra.json --account "~/.starkli-wallets/deployer/account-1.json"
# starkli declare --watch target/dev/sonic_force_disperse.sierra.json