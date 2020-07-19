pragma solidity >=0.4.22 <0.7.0;

contract Resource {
    
    struct TransferHistory {
        string _from;
        string _to;
        uint256 time;
        uint amount;
        string status;
    }
    
    struct PurchaseHistory {
        address _from;
        uint256 time;
        uint amount;
    }
    
    address public owner;
    string public name;
    bool public isGov;
    uint public amount;
    uint public price;
    uint public transfersNumber;
    uint public purchaseNumber;
    string public transferStatus;
    
    TransferHistory[] public transferHistories;
    PurchaseHistory[] public purchaseHistories;

    constructor(string memory _name, uint _amount, bool _isGov) public {
        owner = tx.origin;
        name = _name;
        isGov = _isGov;
        transfersNumber = 0;
        purchaseNumber = 0;
        amount = _amount;
    }

    
    function addTransfer(string memory __from, string memory __to, uint _amount, string memory _status) public {
        transfersNumber++;
        TransferHistory memory newTransfer;
        newTransfer._from = __from;
        newTransfer._to = __to;
        newTransfer.amount = _amount;
        newTransfer.status = _status;
        transferHistories[transfersNumber];
        transfersNumber++;
    }
    
    
    function purchaseResource(uint _amount) public enoughAmount returns (bool) {
        if (amount < _amount) {
            return false;
        }
        PurchaseHistory memory newPurchase;
        newPurchase._from = msg.sender;
        newPurchase.time = block.timestamp;
        newPurchase.amount = _amount;
        purchaseHistories[purchaseNumber];
        purchaseNumber++;
        amount -= _amount;
        
    }
    
    // getter transfer history
    function getTransferHistoryFrom(uint _index) public view returns (string memory) {
        return transferHistories[_index]._from;
    }
    
    function getTransferHistoryTo(uint _index) public view returns (string memory) {
        return transferHistories[_index]._to;
    }
    function getTransferHistoryTime(uint _index) public view returns (uint256) {
        return transferHistories[_index].time;
    }
    function getTransferHistoryAmount(uint _index) public view returns (uint) {
        return transferHistories[_index].amount;
    }
    
    // getter purchaseHistory
    function getPurchaseHistoryFrom(uint _index) public view returns (address) {
        return purchaseHistories[_index]._from;
    }
    function getPurchaseHistoryTime(uint _index) public view returns (uint256) {
        return purchaseHistories[_index].time;
    }
    function getPurchaseHistoryAmount(uint _index) public view returns (uint) {
        return purchaseHistories[_index].amount;
    }
        
        
    modifier enoughAmount() {
        require(amount > 0);
        _;
    }
    
    
    
    
    
    
    
    
}