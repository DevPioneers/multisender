#!/bin/sh
# Be sure to give the shell script execute permissions with `chmod +x script.sh` if you haven't already.

export STARKNET_RPC="https://starknet-goerli.infura.io/v3/8eb7d215d441492aad3c381f0b22c850"
export STARKNET_KEYSTORE="~/.starkli-wallets/deployer/key.json"
export STARKNET_ACCOUNT="~/.starkli-wallets/deployer/account.json"

# *Note: Uncomment the block 2 lines below before using.

# Step 1: Approve 
# approve(spender, amount) (spender == launchpad contract == 0x035a572ab0c45340c0aa780d7cac708d2243a8c579b3b42062592f52eb14534b, amount == u256:1000000000000000000000000000000) 

# echo "Approve contract"
# starkli invoke eth approve 0x05f3073dff92a8f1b84ebdb60adfc64ea8d494838ae83d5db2fe779ab9f43ec2 u256:1000000000000000000000000000000

# ================================================================================================================================================================================
# Step 2: Set Allowed Token for create launch pool
# set_allowed_token(token, allowed) 0x00DFE8283c6e6500ABa7C5af8434Db5CDd5fdba0c47fC4d9D90A834BE22d2F8d

# echo "Set Allowed Token for create launch pool"
# starkli invoke 0x05f3073dff92a8f1b84ebdb60adfc64ea8d494838ae83d5db2fe779ab9f43ec2 set_allowed_token 0x045670d09378f60552513c22237f0C52df8EDEf86e649396E4aaaF0Ea5F72BEE 1

# ================================================================================================================================================================================
# Step 3: Approve 

# echo "Approve for use allowed token"
# starkli invoke 0x045670d09378f60552513c22237f0C52df8EDEf86e649396E4aaaF0Ea5F72BEE approve 0x05f3073dff92a8f1b84ebdb60adfc64ea8d494838ae83d5db2fe779ab9f43ec2 u256:1000000000000000000000000000000

# ================================================================================================================================================================================
# Step 4: Create Public Pool -> pool_creator, token_sale, ico_start_time, ico_end_time, total_sale, total_sold, token_price(eth, example: 1000 ICO Token / 1ETH => token_price = 0.001), alloc_max, alloc_min, payment_token, 
# create_pool(pool_creator, token_sale, ico_start_time, ico_end_time, ico_claim_time, total_sale, total_sold, token_price, alloc_max, alloc_min, payment_token, payment_receiver)
# $pool_creator:    Contract address of this pool owner
# $token_sale:      Contract address of this ICO sale token
# ico_start_time:   Start time. Timestamps in seconds
# ico_end_time:     End time. Timestamps in seconds
# ico_claim_time:   Claim time. Timestamps in seconds
# total_sale:       Amount token total sale x decimals
# total_sold:       Init state total_sold = 0,
# token_price:      The selling price of the token is based on the price of payment_token. For example: 0.00001ETH/Token => 1e18 * 0.00001
# alloc_max:        Maximum amount to be purchased, based on payment token. For example: 1ETH
# alloc_min:        Minimum amount to be purchased, based on payment token. For example: 1ETH
# payment_token:    Contract address of ETH by default
# payment_receiver: Contract address of the recipient of ICO

# echo "Create Public Pool"
# starkli invoke 0x05f3073dff92a8f1b84ebdb60adfc64ea8d494838ae83d5db2fe779ab9f43ec2 create_pool 0x026310c8e55ba131149620f7ee816ae336bb311e89f14c8cd871a1ed7cd056ee 0x045670d09378f60552513c22237f0C52df8EDEf86e649396E4aaaF0Ea5F72BEE 1696830000 1696842000 1698842000 u256:20000000000000000000 u256:0 u256:1000 u256:20000 u256:5000 addr:eth 0x07eaF4be4DC1b51C1F12A6317db70030EFaaE61A657E8aF582e1c473f54B9De3

# ================================================================================================================================================================================

# Step 5: Buy ICO Token use payment token(payment token default: ETH Token)
# buy_token_with_payment_token(pool_id:u64, buy_amount:u256, payment_token:ContractAddress)

# echo "Buy ICO Token use payment token"
# starkli invoke 0x05f3073dff92a8f1b84ebdb60adfc64ea8d494838ae83d5db2fe779ab9f43ec2 buy_token_with_payment_token 2 u256:5000 addr:eth

# ================================================================================================================================================================================

# Step 6: Claim Token
# claim_token(pool_id:u64)

echo "Claim Token by pool id"
starkli invoke 0x05f3073dff92a8f1b84ebdb60adfc64ea8d494838ae83d5db2fe779ab9f43ec2 claim_token 2