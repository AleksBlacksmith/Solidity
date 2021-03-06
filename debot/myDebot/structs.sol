
/**
 * This file was generated by TONDev.
 * TONDev is a part of TON OS (see http://ton.dev).
 */
pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

struct purchase {
        uint identifier;
        string purchaseName;
        uint number;
        uint createTime;
        bool bought;
        uint price;
    }

    struct allPurchase {
        uint paid;
        uint notPaid;
        uint totalPrice;
    }

interface iTodo {

    function newPurchase(string purchaseName, uint number) external;
    function buy(uint id, uint price) external;
    function delPurchase(uint id) external;
    function getPurchase() external returns (purchase[] shoping);
    function getStat() external returns (allPurchase);
    
}

interface IMsig {
   function sendTransaction(address dest, uint128 value, bool bounce, uint8 flags, TvmCell payload  ) external;
}

contract structs {

    mapping (uint => purchase) public purchaseList;

}
