// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

contract StakeContract {
    mapping(address => uint256) public s_balances;

    error StakeContract_TransferFailed();

    function stake (uint256 amount, address token) external returns (bool) {
        s_balances[msg.sender] = s_balances[msg.sender] + amount;

        bool success = IERC20(token).transferFrom(msg.sender, address(this), amount);
        if(!success) revert StakeContract_TransferFailed();
        return success;

    }
}