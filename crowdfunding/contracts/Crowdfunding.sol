// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Crowdfunding {
    address public owner;
    uint public goal;
    uint public endTime;
    mapping(address => uint) public contributions;

    constructor(uint _goal, uint _durationDays) {
        owner = msg.sender;
        goal = _goal;
        endTime = block.timestamp + (_durationDays * 1 days);
    }

    function contribute() public payable {
        require(block.timestamp <= endTime, "Crowdfunding has ended");
        contributions[msg.sender] += msg.value;
    }

    function withdraw() public {
        require(block.timestamp > endTime, "Crowdfunding has not ended yet");
        require(address(this).balance >= goal, "Goal not reached");
        require(msg.sender == owner, "Only the owner can withdraw");
        payable(owner).transfer(address(this).balance);
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
