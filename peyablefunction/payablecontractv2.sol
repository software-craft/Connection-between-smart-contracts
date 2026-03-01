// License
// SPDX-License-Identifier: GPL-3.0

// Version Solidity
pragma solidity 0.8.30;

contract PayableContractV2 {

    function sendEther() public payable {}

    function withDrawEther(uint256 amount) public {
        
        (bool success, ) = msg.sender.call{value: amount}("");

        require (success, "Transfer Fail");
    }
}