# Connection Between Smart Contracts

This project demonstrates different interaction patterns between smart contracts in Solidity, including permission validation, error handling, `payable` contracts, and communication through interfaces. It is designed as an educational base and reference for developers who want to learn best practices in Ethereum.

---

## ⚙️ Smart Contracts

### 1. `RequireTest` (multiple versions)
Illustrates three ways to verify that the sender (`msg.sender`) is the admin:
- **`checkAdmin`**: uses `if (msg.sender != admin) revert();` without a message.
- **`checkAdminRequire`**: uses `require` with an error code (`"01"`).
- **`adminCheckCustomErrors`**: uses a custom error (`SenderNotAdmin`).

These examples show how to manage access control and optimize gas consumption.

### 2. `PayableContractV2` and `PeyableContract`
- **`sendEther`**: `payable` function that allows the contract to receive Ether.
- **`withDrawEther`**: withdraws a specific amount of Ether to the sender using `call`.

Both contracts serve as a base for handling funds inside a contract.

### 3. `IResult` (Interface)
Defines the functions that a compatible contract must implement:
- `addition(uint256 num1_, uint256 num2_)`
- `setResult(uint256 num_)`
- `setFee(uint256 newFee_)`

### 4. `Result`
Stores:
- `result`: result of an operation.
- `admin`: admin address (assigned in the constructor).
- `fee`: fee (initialized to 3).

**Main functions:**
- `setResult(uint256 num_)`: updates the result (no access restriction).
- `setFee(uint256 newfee_)`: only the admin can update the fee.

### 5. `Sum`
Contract that interacts with a `Result` address (injected in the constructor).
- **`addition`**: calculates the sum of two numbers and calls `setResult` on the `Result` contract.
- **`setFee`**: calls `setFee` on the `Result` contract to update the fee.

This example shows how a contract can call functions from another contract through an interface.

---

## 🔗 Contract Interaction

The main flow occurs between `Sum` and `Result`:
1. `Result` is deployed first (with an admin address).
2. `Sum` is deployed passing the `Result` address.
3. When calling `Sum.addition(5,3)`, this contract calculates `8` and executes `IResult(result).setResult(8)`, updating the state in `Result`.
4. Similarly, `Sum.setFee(10)` updates the fee in `Result`, as long as the sender is the admin.

---

## 🚀 Deployment and Testing

### Requirements
- Solidity compiler `0.8.30`.
- Tools such as Hardhat, Foundry, or Truffle.