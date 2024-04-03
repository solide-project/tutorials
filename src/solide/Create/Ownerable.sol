// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Ownerable {
    event ChangeOwnerEvent(address);
    address public owner;

    constructor(address _owner) {
        owner = _owner;
        emit ChangeOwnerEvent(_owner);
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
}
