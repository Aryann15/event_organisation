//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <=0.9.0;

contract event_Contract{

    struct Event{
        address organizer;
        string name;
        uint date;
        uint price;
        uint ticketCount;
        uint ticketRemain;
    }

    mapping (uint => Event) public events;
    mapping (address => mapping(uint=> uint)) public tickets;
    uint public nextId;
     
    function createEvent (string memory name, uint date, uint price, uint ticketCount) external {
        require (date> block.timestamp, " You can organize events for future dates");
        require (ticketCount>0,"You cannot create event where the number of tickets is zero ");

        events[nextId] = Event(msg.sender,name,date,price,ticketCount,ticketCount);
        nextId++;
    }
}