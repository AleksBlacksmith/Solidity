
/**
 * This file was generated by TONDev.
 * TONDev is a part of TON OS (see http://ton.dev).
 */
pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import "interfaceGameObject.sol";

contract gameObject is interfaceGameObject {

    constructor() public {
        require(tvm.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
    }

    struct base {
        uint baseXP;
        mapping (address => unit) warUnit;
    }

    struct unit {
        uint unitXP;
        uint unitPower;
    }

    mapping (address => base) internal baseUnit;

    // mapping (address => unit) internal warUnit;

    modifier accept() {
        tvm.accept();
        _;
    }

    function newBaseUnit(address baseAddr, address unitAddr) virtual public accept {
        // address addr = msg.sender;
        // baseUnit[addr];
    }

    // function setDeleteBaseUnit(address addr) public accept {
    //     // проверка
    //     delete baseUnit[addr];
    // }

    function getXP(address addr) virtual public accept {
        baseUnit[msg.sender].warUnit[addr].unitXP = 4;
    }

    function getPower(address addr) virtual public accept {
        // baseUnit[msg.sender].warUnit[addr].unitPower = 2;
    }
        
    function checkLiveUnit(address addr) private view accept returns(string) {
        if (baseUnit[msg.sender].warUnit[addr].unitXP == 0) { 
            return ("Unit is dead");
            // i
        }
        else {
            return ("Unit is live");
        }
    }

    function checkLiveBase(address addr) private view accept returns(string) {
        if (baseUnit[addr].baseXP == 0) { 
            msg.sender.transfer(1, true, 160);
            return ("Base is dead");
        }
        else {
            return ("Base is live");
        }
    }

    function baseInfo(address baseAddr, address warAddr, address archAddr) public accept returns (uint baseXP, uint warriorXP, uint warriorPower, uint archerXP, uint archerPower) {
        uint baseXP = baseUnit[baseAddr].baseXP;
        uint warriorXP = baseUnit[baseAddr].warUnit[warAddr].unitXP;
        uint warriorPower = baseUnit[baseAddr].warUnit[warAddr].unitPower;
        uint archerXP = baseUnit[baseAddr].warUnit[archAddr].unitXP;
        uint archerPower = baseUnit[baseAddr].warUnit[archAddr].unitPower;
    }

    // function destroyUnit(address addr) internal accept {
    //     addr.transfer(1, true, 160);
    // }

    function getAttackUnit(address baseAddr, address unitAddr, address myUnit) virtual external accept override {
        // addr = msg.sender;
        baseUnit[baseAddr].warUnit[unitAddr].unitXP -= baseUnit[msg.sender].warUnit[myUnit].unitPower;
        // checkLiveUnit(addr);
    }

    function getAttackBase(address baseAddr, address myUnit) virtual external accept override {
        baseUnit[baseAddr].baseXP -= baseUnit[msg.sender].warUnit[myUnit].unitPower;
        // checkLiveBase(addr);
    }

}
