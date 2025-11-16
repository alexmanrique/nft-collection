// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.30;

import {ERC721} from "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";

contract BANftCollection is ERC721 {
    uint256 public totalSupply;
    uint256 public currentTokenId;
    string public baseURI;

    event Mint(address to, uint256 tokenId);

    constructor(string memory name_, string memory symbol_, uint256 initialSupply_, string memory baseURI_) ERC721(name_, symbol_) {
        baseURI = baseURI_;
        totalSupply = initialSupply_;
    }

    function mint() public {
        require(currentTokenId < totalSupply, "Total supply reached");
        _safeMint(msg.sender, currentTokenId);
        currentTokenId++;
        emit Mint(msg.sender, currentTokenId--);
    }

    function _baseURI() internal view override returns (string memory) {
        return baseURI;
    }
}
