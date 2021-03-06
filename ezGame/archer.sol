
/**
 * This file was generated by TONDev.
 * TONDev is a part of TON OS (see http://ton.dev).
 */
pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import "warUnit.sol";

contract archer is warUnit {

    constructor() public {
        require(tvm.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
    }

    uint user = 1;
    uint enemy = 2;

    function getXP() public override {
        tvm.accept();
        userNum[user].warriorXP = 5;
    }

    function getShield() public override {
        tvm.accept();
        userNum[user].archerShield = 2;
    }

    function getPower() public override {
        tvm.accept();
        userNum[user].archerPower = 3;
    }

    function getAttack(string warUnit) public override returns (string) {
        tvm.accept();
        if (warUnit == "warrior") {
        userNum[user].archerXP -= userNum[enemy].warriorPower - userNum[user].archerShield;
        }
        else if (warUnit == "archer") {
        userNum[user].archerXP -= userNum[enemy].archerPower - userNum[user].archerShield;
        }
        if (userNum[user].warriorXP <= 0) {
            if (warUnit == "warrior") {
            userNum[enemy].warriorAddress.transfer(1, true, 160);
            }
            else {
            userNum[enemy].archerAddress.transfer(1, true, 160);
            }
        return ("Unit is dead");
        }
    }



}
