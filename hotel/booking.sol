pragma solidity ^0.6.0;

contract hotel_booking{
    address payable public owner;
    enum state{vaccent, occupied}
    state currentstate;
    constructor() public{
        owner= msg.sender;
        currentstate=state.vaccent;
    }
    modifier onlywhilevaccent{
        require(currentstate==state.vaccent,"room is not available");
    _;
    }
    modifier costs{
        require(msg.value >= 2,"not enought money ");
    _;
    }
    receive() external payable onlywhilevaccent costs(){
        owner.transfer(msg.value);
        currentstate=state.occupied;
    }

}