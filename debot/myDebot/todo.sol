
/**
 * This file was generated by TONDev.
 * TONDev is a part of TON OS (see http://ton.dev).
 */
pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import "structs.sol";

contract todo is structs {

    uint256 ownerPubkey;
    uint purId = 0;

    constructor(uint256 pubkey) public {
        require(pubkey != 0, 120);
        tvm.accept();

        ownerPubkey = pubkey;
    }

    modifier onlyOwner() {
        require(msg.pubkey() == ownerPubkey, 102);
        _;
    }

    function newPurchase(string purchaseName, uint number) public onlyOwner {
        tvm.accept();
        purId++;
        purchaseList[purId] = purchase(purId, purchaseName, number, now, false, 0);
    }

    function delPurchase(uint id) public onlyOwner {
        require(purchaseList.exists(id), 102);
        tvm.accept();
        delete purchaseList[id];
    }

    function buy(uint id, uint price) public onlyOwner {
        tvm.accept();
        purchaseList[id].bought = true;
        purchaseList[id].price = price;
    }

    function getPurchase() public returns (purchase[] shoping) {
        uint identifier;
        string purchaseName;
        uint number;
        uint createTime;
        bool bought;
        uint price;

        for ((uint id, purchase pur) : purchaseList) {
            identifier = pur.identifier;
            purchaseName = pur.purchaseName;
            number = pur.number;
            createTime = pur.createTime;
            bought = pur.bought;
            price = pur.price;
            shoping.push(purchase(identifier, purchaseName, number, createTime, bought, price));
        }
    }

    function getStat() public returns(allPurchase stat) {
        uint paid;
        uint notPaid;
        uint totalPrice;

        for ((, purchase pur) : purchaseList) {
            if (pur.bought) {
                paid += pur.number;
                totalPrice += pur.price;
            }
            else {
                notPaid += pur.number;
            }
        }
        stat = allPurchase(paid, notPaid, totalPrice);
    }
}
