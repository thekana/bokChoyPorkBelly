pragma solidity >=0.4.22 <0.7.0;

import "./Resource.sol";

contract Merchant {
    
    
    address public owner;
    string public name;
    bool public isGov;
    
    
    mapping(string => Resource) public resources;
    mapping(string => bool) public resourceExist;
    
    constructor(string memory _name, bool _isGov) public {
        name = _name;
        isGov = _isGov;
        owner = tx.origin;
    }
    
    function isGovernment() public view returns (bool) {
        return isGov;
    }
    
    function isResource(string memory _name) public view returns (bool) {
        if (resourceExist[_name]) {
            return true;
        }
        return false;
    }
    
    function addResource(string memory _resourceName, Resource _resourceAddress) public {
        resources[_resourceName] = _resourceAddress;
    }
    
    
    // struct Resouce {
    //     string name;
    //     uint amount;
    //     uint price;
    //     bool available;
    // }
    
    // mapping(string => Resource)
    
    
    
}