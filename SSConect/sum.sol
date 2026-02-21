// Licencia
// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.30;

import "./interface/IResult.sol";

contract Sum {
    address result;

    constructor(address result_) {
        result = result_;
    }

    function addition(uint256 num1_, uint256 num2_) external {
        uint256 result_ = num1_ + num2_;
        IResult(result).setResult(result_);
    }
}