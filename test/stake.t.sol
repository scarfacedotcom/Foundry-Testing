// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Stake.sol";
import "../src/MockToken.sol";

contract StakeTest is Test {

    StakeContract public stakeContract;
    MockToken public token;
    uint256 public constant AMOUNT = 1e18;

    function setUp() public {
        stakeContract = new StakeContract();
        token = new MockToken();
    }

    function testStakingTokens() public {
        token.approve(address(stakeContract),AMOUNT);
        bool success = stakeContract.stake(AMOUNT, address(token));
        assertTrue(success);

    }

}