// License
// SPDX-License-Identifier: GPL-3.0

// Version Solidity
pragma solidity 0.8.30;

contract Result {
    uint256 public result;
    address public admin;
    uint256 public fee;

    constructor(address admin_) {

        admin = admin_;
        fee = 3;
    }

    function setResult(uint256 num_) external {
        result = num_;
    }

    function setFee(uint256 newfee_ ) external {
        if (msg.sender != admin) revert();
        fee = newfee_;
        
    }

}