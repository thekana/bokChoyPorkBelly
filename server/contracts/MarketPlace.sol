pragma solidity >=0.4.22 <0.7.0;

import "./Merchant.sol";
import "./ResourceManager.sol";
import "./Resource.sol";

contract MarketPlace {
    
    // ====== DATA STRUCTURES ======
    string public test = "AAAAA";

    function getTest() public view returns(string memory) {
      return test;
    }

    mapping(string => ResourceManager) public resourceManagers;
    mapping(address => Merchant) public merchants;
    // mapping(address=>address) public buyers;
    
    mapping(address => bool) public merchantExist;
    // mapping(address => bool) public buyerExist;
    
    
    //
    
    
    // ====== FUNCTIONS ======
    
    function registerMerchant(string memory _name, bool _isGov) public {
        Merchant newMerchant = new Merchant(_name, _isGov);
        merchants[msg.sender] = newMerchant;
    }
    
    
    function getMerchant() public view isMerchantModifier returns (Merchant) {
        return merchants[msg.sender];
    }
    
    function isMerchant() public view returns (bool) {
        if (merchantExist[msg.sender]) {
            return true;
        } else {
            return false;
        }
    }
    
    function getResource(string memory _resourceName) public view returns (ResourceManager) {
        return resourceManagers[_resourceName];
    }
    
    
    function createResourceType(string memory _resourceType, uint _purchaseNumber, uint256 _purchasePeriod) public returns (string memory) {
        ResourceManager newResourceManager = new ResourceManager(_resourceType, _purchaseNumber, _purchasePeriod);
        resourceManagers[_resourceType] = newResourceManager;
        return _resourceType;
    }
    
    
    function getResourceManager(string memory _resourceType) public view returns (ResourceManager) {
        return resourceManagers[_resourceType];
    }
    
    function createSingleResource(string memory _resourceType, string memory _resourceName, uint _amount, bool _isGov) public returns (Resource) {
        Resource newResource = new Resource(_resourceName, _amount, _isGov);
        ResourceManager curManager = ResourceManager(resourceManagers[_resourceType]);
        curManager.addResource(newResource);
        return newResource;
    }
    
    
    
    
    
    // ====== MODIFIERS ======
    
    modifier isMerchantModifier() {
        require(isMerchant());
        _;
    }
    
}