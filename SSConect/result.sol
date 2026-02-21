// License
// SPDX-License-Identifier: GPL-3.0

// Version Solidity
pragma solidity 0.8.30;

contract Result {
    uint256 public result;

    function setResult(uint256 num_) external {
        result = num_;
    }
}