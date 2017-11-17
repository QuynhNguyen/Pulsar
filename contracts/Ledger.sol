pragma solidity ^0.4.4;

contract Ledger {

    // Ledger to track investor investment
    mapping (address=>uint) public ledger;

    // List of account. This maps to the keys inside the ledger map
    address[] public ledgerAccounts;

    // Owner of this Ledger
    address public owner; 

    function Ledger() public {
        owner = msg.sender;
    }

}