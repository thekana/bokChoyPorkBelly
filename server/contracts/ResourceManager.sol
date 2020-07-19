pragma solidity >=0.4.22 <0.7.0;

import "./Resource.sol";

contract ResourceManager {
    
    // struct transferHistory {
    //     string from;
    //     string to;
    //     uint256 time;
    //     uint amount;
    // }
    
    struct BuyerRecord {
        uint256 time;
        uint amount;
    }
    
    string public resourceType;
    mapping( address => BuyerRecord ) public buyerRecords;
    uint public purchaseNumber;
    uint256 public purchasePeriod;
    Resource[] public resources;
    uint public resourceNumber;
    
    constructor(string memory _resourceType,uint _purchaseNumber, uint256 _purchasePeriod) public {
        resourceType = _resourceType;
        purchaseNumber = _purchaseNumber;
        purchasePeriod = _purchasePeriod;
        resourceNumber = 0;
    }
    
    function addResource(Resource _resourceAddress) public {
        resources[resourceNumber] = _resourceAddress;
        resourceNumber++;
    }
    
    
    function checkBuyerCondition(uint _amount) public returns (bool) {
        uint curBuyerAmount = buyerRecords[msg.sender].amount;
        uint256 curBuyerTime = buyerRecords[msg.sender].time;
        if (curBuyerTime+purchasePeriod >= block.timestamp) {
            resetBuyer();
            return true;
        } else {
            if (curBuyerAmount+_amount <= purchaseNumber) {
                updateBuyer(_amount);
                return true;
            }
        }
        return false;
    }
    
    function updateBuyer(uint _amount) public {
        BuyerRecord memory newBuyerRecord;
        newBuyerRecord.time = block.timestamp;
        newBuyerRecord.amount = _amount;
        buyerRecords[msg.sender] = newBuyerRecord;
    }
    
    function resetBuyer() public {
        buyerRecords[msg.sender].amount = 0;
    }
    
    // modifier purchaseRule() {
    //     // if timer
    //     uint curBuyerAmount = buyerRecords[msg.sender].amount;
    //     uint256 curBuyerTime = buyerRecords[msg.sender].time
    //     if (curBuyerTime <)
    //     _;
    // }
    
    
    
    
}