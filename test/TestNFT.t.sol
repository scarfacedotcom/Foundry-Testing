// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
// import "../src/GenesisIgnite.sol";
import "../src/TestNFT.sol";

contract GenesisIgniteNFTTest is Test {
    GenesisIgniteNFT public genesisIgniteNFT;

    function setUp() public {
        genesisIgniteNFT = new GenesisIgniteNFT(
            "GenesisIgniteNFT",
            "GNFT",
            "https://ipfs.io/ipfs/QmVt9ww7CkwjjrbekK4XSrXqNGXEHXp1sJT8t9sUchcpi8"
        );

        console.log(address(genesisIgniteNFT));
    }

    function testMint() public {
        address to = address(this);
        uint256 tokenId = 1;
        genesisIgniteNFT.mint(to, tokenId);
        uint256 totalSupply = genesisIgniteNFT.totalSupply();
        assertEq(totalSupply, 1, "Incorrect total supply after minting");
    }

    //   function testSetTokenURI() public {
    //     uint256 tokenId = 1;
    //     string memory tokenURI = "https://ipfs.io/ipfs/QmVt9ww7CkwjjrbekK4XSrXqNGXEHXp1sJT8t9sUchcpi8/token1";
    //     genesisIgniteNFT.mint(address(this), tokenId);
    //     genesisIgniteNFT.setTokenURI(tokenId, tokenURI);
    //     string memory retrievedURI = genesisIgniteNFT.tokenURI(tokenId);
    //     assertEq(retrievedURI, tokenURI, "Incorrect token URI after setting");
    // }

    //     function testBurn() public {
    //     uint256 tokenId = 1;
    //     genesisIgniteNFT.mint(address(this), tokenId);
    //     genesisIgniteNFT.burn(tokenId);
    //     bool exists = genesisIgniteNFT.exists(tokenId);
    //     assertEq(exists, false, "Token still exists after burning");
    // }
}
