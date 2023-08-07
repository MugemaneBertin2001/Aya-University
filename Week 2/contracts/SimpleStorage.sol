// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleStorage{
    uint data;

    function updateData(uint _data) external {
        data = _data;

    }
    function readData() external view returns(uint){
        return data;
    }
}