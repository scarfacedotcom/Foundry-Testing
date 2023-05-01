// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Safe.sol";

contract SafeTest is Test {
    Safe public safe;
    receive() external payable{}

    function setUp() public {
        safe = new Safe();
        console.log("The contract has been deployed to:", address(safe));
    }

    function test_Withdraw(uint96 amount) public {
        payable(address(safe)).transfer(amount);
        uint256 preBalance = address(this).balance;
        safe.withdraw();
        uint256 postBalance = address(this).balance;
        assertEq(preBalance + 1 ether, postBalance);

    }
}