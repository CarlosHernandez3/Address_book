// SPDX-License-Identier:MIT

pragma solidity ^0.8.0;

contract AddressBook {
    mapping(address => address[]) private addressBook; // my address to a list of addresses
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function addAddress(address newAddress) public onlyOwner {
        addressBook[msg.sender].push(newAddress);
    }

    function removeAddress(address addr) public onlyOwner {
        uint256 index = getIndex(addr);
        delete addressBook[addr][index];
    }

    function getIndex(address addr) public view onlyOwner returns (uint256) {
        uint256 length = addressBook[msg.sender].length;
        for (uint i = 0; i < length; i++) {
            if (addressBook[msg.sender][i] == addr) {
                return (i);
            }
        }
    }

    function viewAllAddresses(
        address addr
    ) public view onlyOwner returns (address[] memory) {
        return (addressBook[addr]);
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
}
