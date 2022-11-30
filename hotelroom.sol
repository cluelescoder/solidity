pragma solidity ^0.6.0;

contract hotelroom {
    //ether-pay smart contracts
    //modifiers
    //visibility
    //events
    //enums
    //events
    enum statuses {vacant,occupied}
    statuses currentstat;
    address payable public owner;

    event occupy(address _occupant,uint _value);

    constructor() public {
        owner=msg.sender;
        currentstat = statuses.vacant; 
    }
    modifier onlywhilevacant{
        require(currentstat==statuses.vacant,"currently occupied.");
        _;
    }
    modifier costs(uint _amount){
        require(msg.value>= _amount,"not enough ether provided.");
        _;
    }
    receive() external payable onlywhilevacant costs(2 ether){
        owner.transfer(msg.value);
        currentstat=statuses.occupied;
        emit occupy(msg.sender,msg.value);
    }
}