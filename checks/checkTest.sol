// Licencia
// SPDX-License-Identifier: GPL-3.0

// Version Solidity
pragma solidity 0.8.30;

error SenderNotAdmin(address);

contract RequireTest {
    address admin;

    constructor(address admin_) {
        admin = admin_;
    }

    // Reducing GAS Consumption

    
    // Function + if check: msg.sender == admin
    function checkAdmin() public view {
        if (msg.sender != admin) revert();
    }

    // Function + require check
    function checkAdminRequire() public view {
        require(msg.sender == admin, "01"); // Code 01: Msg.sender is not admin external documentation
    }

    // Function + if + custom error
    function adminCheckCustomErrors() public view {
        if (msg.sender != admin) revert SenderNotAdmin(msg.sender);
    }

}