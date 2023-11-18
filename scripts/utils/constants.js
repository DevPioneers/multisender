import { RpcProvider } from "starknet"; 
import { readFile } from 'fs/promises';

export const provider = new RpcProvider({
    nodeUrl: "https://starknet-goerli.infura.io/v3/8eb7d215d441492aad3c381f0b22c850",
});

export const deployedPrivateKey = "0x057ccf001c826d3987059190101a6cbee4a5bd47bd3b71b8f8e0dcd4a2e66235";
export const deployedAddress = "0x07eaF4be4DC1b51C1F12A6317db70030EFaaE61A657E8aF582e1c473f54B9De3";