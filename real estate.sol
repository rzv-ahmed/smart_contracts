// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

// Real Estate Contract Buy and sell
contract RealEstate {
//struct property to store information
    struct Property{
        string name;
        string location;
        string description;
        address owner;
        uint price;
        bool forSale;
    }
// mapping to serialization struct
    mapping (uint => Property) public properties;
//array of all property id
    uint[] public propertyIds;
//event exicute when the property sold
    event PropertySold(uint256);

    function listProperty4Sale(uint _Id,uint _price, string memory _name,string memory _location, string memory _description) public{
        Property memory newproperty=Property({
            price:_price,
            name:_name,
            owner:msg.sender,
            location:_location,
            description:_description,
            forSale:true
        });

        properties[_Id]=newproperty;

        propertyIds.push(_Id);
    }

    function buyProperty(uint _id)public payable  {
        Property storage property=properties[_id];

        require(property.forSale, "this property not for sale");
        require(property.price <= msg.value, "Insufficient balance");

        property.owner=msg.sender;
        property.forSale=false;
        payable(property.owner).transfer(property.price);
// Emit the property sold event
        emit PropertySold(_id);
    }


    
}
