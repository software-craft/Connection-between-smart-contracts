// License
// SPDX-License-Identifier: GPL-3.0

// Version Solidity
pragma solidity 0.8.30;

error SenderNotAdmin(address);

contract RequireTest {

    address admin;

    constructor (address admin_) {
        admin = admin_;
    }

    // Function msg.sender == admin
    function checkAdmin() public view {
        if(msg.sender != admin) revert();
    }
    // Funcition + Require Check
    function checkAdminRequire() public view {
        require(msg.sender == admin, "msg.sender is not admin");
    }
    // Function + if + custom error
    function checkAdminCustomError() public view {
        if (msg.sender != admin) revert SenderNotAdmin(msg.sender);

    }

}