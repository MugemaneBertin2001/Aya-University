// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Bank {
    mapping(address => uint256) private balances;
    mapping(address => uint256) private loanAmounts;
    uint256 private totalDeposits;

    event Deposit(address indexed accountHolder, uint256 amount);
    event Withdraw(address indexed accountHolder, uint256 amount);
    event Transfer(address indexed from, address indexed to, uint256 amount);

    modifier hasSufficientFunds(uint256 amount) {
        require(balances[msg.sender] >= amount, "Insufficient funds");
        _;
    }

    function deposit() external payable {
        require(msg.value > 0, "Amount must be greater than 0");
        balances[msg.sender] += msg.value;
        totalDeposits += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(uint256 amount) external hasSufficientFunds(amount) {
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
        emit Withdraw(msg.sender, amount);
    }

    function getBalance() external view returns (uint256) {
        return balances[msg.sender];
    }

    function getTotalDeposits() external view returns (uint256) {
        return totalDeposits;
    }

    function transfer(address to, uint256 amount) external hasSufficientFunds(amount) {
        balances[msg.sender] -= amount;
        balances[to] += amount;
        emit Transfer(msg.sender, to, amount);
    }

    function applyForLoan(uint256 amount) external {
        require(amount > 0, "Loan amount must be greater than 0");
        require(loanAmounts[msg.sender] == 0, "You already have an active loan");

        // Your logic to process loan applications and calculate interest can be added here.
        // For simplicity, we're not implementing the loan management in this example.
    }
}
