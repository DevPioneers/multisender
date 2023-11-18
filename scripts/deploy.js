import { Account, json } from 'starknet';
import { provider, deployedAddress, deployedPrivateKey } from './utils/constants.js';
import fs from "fs";

const testClassHash = "0x06e7cdec659abf9e42cf434f6f5f3ee16aa20001efdb69505b47d35078f424d9";


const account = new Account(provider, deployedAddress, deployedPrivateKey, "0");

const deployResponse = await account.deployContract(
    { 
        classHash: testClassHash 
    },
    {
        nonce: account.nonce,
        version: 2,
        maxFee: 100000,
    }
);

console.log('deployResponse', deployResponse);

await provider.waitForTransaction( deployResponse.transaction_hash);

console.log("deployResponse", deployResponse);