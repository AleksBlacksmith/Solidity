
/**
 * This file was generated by TONDev.
 * TONDev is a part of TON OS (see http://ton.dev).
 */
pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import "gameObject.sol";
// import "baseStation.sol";

contract warrUnit is gameObject {

    constructor() public {
        require(tvm.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
    }

    // constructor(baseStation newBaseUnit) public {
    //     address addr = msg.sender;
    //     newBaseUnit;
    // }
    
    // function newBaseUnit(address addr) public {
    //     addr = msg.sender; 
    //     setNewBaseUnit(addr);
    // }
    
    // function getXP(address addr) virtual internal override {

    // }

    // function getPower(address addr) virtual internal override {

    // }

    function attackUnit(interfaceGameObject baseAddr,interfaceGameObject unitAddr,interfaceGameObject myUnit) internal pure accept {
        baseAddr.getAttackUnit(baseAddr, unitAddr, myUnit);
    }

    function attackBase(interfaceGameObject baseAddr, interfaceGameObject myUnit) internal pure accept {
        baseAddr.getAttackBase(baseAddr, myUnit);
    }




}