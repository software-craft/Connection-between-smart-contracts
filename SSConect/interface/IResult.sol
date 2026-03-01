// License 
// SPDX-License-Identifier: GPL-3.0

// Version Solidity
pragma solidity 0.8.30;

// Interface

interface IResult {

    function addition (uint256 num1_, uint256 num2_) external;
    function setResult(uint256 num_) external;
    function setFee(uint256 newFee_) external;
}