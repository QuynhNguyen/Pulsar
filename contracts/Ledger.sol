pragma solidity ^0.4.4;

contract Ledger {

    // Ledger to track investor investment
    mapping (address=>uint) public ledger;

    // List of account. This maps to the keys inside the ledger map
    address[] public ledgerAccounts;

    // Intial Balance. Deposited by owner of the contract. This can be changed.
    // Unit Type: Wei
    uint256 public initialBalance;

    // Owner of this Ledger
    address public owner; 

    /**
        Modifier
     */

    // Modifier to validate that a function can only be executed by the owner
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    /**
        Events
     */

    // Trigger when initial balance changed
    event InitialBalanceChanged();

    /**
        Constructor
     */
    function Ledger() public {
        owner = msg.sender;
    }

    /**
        Owner Only
     */

     // Use this to increase the inital balance.
     function increaseInitialBalance() public payable onlyOwner {
         require(msg.value > 0);
         initialBalance = initialBalance + msg.value;
         InitialBalanceChanged();
     }

}