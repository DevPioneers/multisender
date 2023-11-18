use starknet::{ContractAddress};
use debug::PrintTrait;

#[starknet::interface]
trait IERC20<TContractState> {
    // IERC20
    fn total_supply(self: @TContractState) -> u256;
    fn balance_of(self: @TContractState, account: ContractAddress) -> u256;
    fn allowance(self: @TContractState, owner: ContractAddress, spender: ContractAddress) -> u256;
    fn transfer(ref self: TContractState, recipient: ContractAddress, amount: u256) -> bool;
    fn transfer_from(
        ref self: TContractState, sender: ContractAddress, recipient: ContractAddress, amount: u256
    ) -> bool;
    fn approve(ref self: TContractState, spender: ContractAddress, amount: u256) -> bool;

    // IERC20Metadata
    fn name(self: @TContractState) -> felt252;
    fn symbol(self: @TContractState) -> felt252;
    fn decimals(self: @TContractState) -> u8;

    // ISafeAllowance
    fn increase_allowance(
        self: @TContractState, spender: ContractAddress, added_value: u256
    ) -> bool;
    fn decrease_allowance(
        self: @TContractState, spender: ContractAddress, subtracted_value: u256
    ) -> bool;

    // IERC20Camel
    fn totalSupply(self: @TContractState) -> u256;
    fn balanceOf(self: @TContractState, account: ContractAddress) -> u256;
    fn transferFrom(
        self: @TContractState, sender: ContractAddress, recipient: ContractAddress, amount: u256
    ) -> bool;

    // ISafeAllowanceCamel
    fn increaseAllowance(self: @TContractState, spender: ContractAddress, addedValue: u256) -> bool;
    fn decreaseAllowance(
        self: @TContractState, spender: ContractAddress, subtractedValue: u256
    ) -> bool;
}


#[starknet::interface]
trait ISonicForceDisperse<TContractState> {
    fn disperse_token(
        ref self: TContractState,
        token: ContractAddress,
        addresses: Array<ContractAddress>,
        amounts: Array<felt252>
    );
}

#[starknet::contract]
mod SonicForceDisperse {
    use array::ArrayTrait;
    use starknet::{ContractAddress, get_caller_address, get_contract_address};
    // use super::ERC20DispatcherTrait;
    // use super::ERC20Dispatcher;
    // use super::{ISonicForceDisperse};
    use super::{IERC20Dispatcher, IERC20DispatcherTrait};
    use box::BoxTrait;
    use traits::{TryInto, Into};
    use option::OptionTrait;

    use debug::PrintTrait;

    #[storage]
    struct Storage {}

    #[constructor]
    fn constructor(ref self: ContractState) {}

    #[external(v0)]
    impl SonicForceDisperseFactory of super::ISonicForceDisperse<ContractState> {
        fn disperse_token(
            ref self: ContractState,
            token: ContractAddress,
            mut addresses: Array<ContractAddress>,
            mut amounts: Array<felt252>,
        ) {
            assert(addresses.len() == amounts.len(), 'Error');
            let token_address: ContractAddress = token;
            let disperse_contract = IERC20Dispatcher { contract_address: token_address };

            loop {
                match addresses.pop_front() {
                    Option::Some(addr) => {
                        let amount_token: u256 = amounts.pop_front().unwrap().into();
                        disperse_contract.transferFrom(get_caller_address(), addr, amount_token);
                    },
                    Option::None(_) => {
                        break;
                    },
                };
            }
        }
    }
}
