
/**
 * This file was generated by TONDev.
 * TONDev is a part of TON OS (see http://ton.dev).
 */
pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import "gameObject.sol";

contract baseStation is gameObject {

    constructor() public {
        require(tvm.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
    }

    function newBaseUnit(address baseAddr, address unitAddr) public accept override {
        baseUnit[baseAddr].warUnit[unitAddr];
    }

    // function getXP(address addr) virtual internal override {}

    // function destroyUnit(address addr) virtual internal {}

    // function deleteBaseUnit(address addr) internal accept {
    //     setDeleteBaseUnit(addr);
    // }
}