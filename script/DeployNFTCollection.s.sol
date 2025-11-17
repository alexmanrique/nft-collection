// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.30;

import {BANftCollection} from "../src/BANftCollection.sol";
import {Script} from "../lib/forge-std/src/Script.sol";

contract DeployNFTCollection is Script {
    function setUp() public {}

    function run() external returns (BANftCollection) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        string memory name = "Blockchain Art NFT";
        string memory symbol = "BANFT";
        uint256 initialSupply = 10000;
        string memory baseURI = "ipfs://bafybeihuvshiwoypjlhwxa3xa3e7ghdokhrjwxahdsrnlcu5adtpjxnheu";

        vm.startBroadcast();
        BANftCollection nftCollection = new BANftCollection(name, symbol, initialSupply, baseURI);
        vm.stopBroadcast();

        return nftCollection;
    }
}
