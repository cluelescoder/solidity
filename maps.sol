pragma solidity ^0.6.0;

contract maps {
    //mappings
    mapping(uint => string) public names;
    mapping(uint=>book) public books;
    mapping(address => mapping(uint=>book)) public mybooks;
    struct book{
        string title;
        string author;
    }
    constructor() public {
        names[1]="Addam";
        names[2]= "swaroop";
        names[3]="rahul";
    }
    function addbook(uint _id,string memory _title,string memory _author ) public {
        books[_id] = book(_title,_author);
    }
    function addmybook(uint _id,string memory _title,string memory _author) public {
        mybooks[msg.sender][_id]=book(_title,_author);
    }
}