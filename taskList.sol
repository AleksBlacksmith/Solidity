
/**
 * This file was generated by TONDev.
 * TONDev is a part of TON OS (see http://ton.dev).
 */
pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

// This is class that describes you smart contract.
contract taskList {
    // Contract can have an instance variables.
    // In this example instance variable `timestamp` is used to store the time of `constructor` or `touch`
    // function call
    uint32 public timestamp;

    // Contract can have a `constructor` – function that will be called when contract will be deployed to the blockchain.
    // In this example constructor adds current time to the instance variable.
    // All contracts need call tvm.accept(); for succeeded deploy
    constructor() public {
        // Check that contract's public key is set
        require(tvm.pubkey() != 0, 101);
        // Check that message has signature (msg.pubkey() is not zero) and
        // message is signed with the owner's private key
        require(msg.pubkey() == tvm.pubkey(), 102);
        // The current smart contract agrees to buy some gas to finish the
        // current transaction. This actions required to process external
        // messages, which bring no value (henceno gas) with themselves.
        tvm.accept();

        timestamp = now;
    }

    struct task {
        string title;
        uint32 time;
        bool done;
    }

    mapping (uint8 => task) taskKey;
    
    uint8 key = 0;
    uint8 num = 0;
    string[] List;

    modifier checkOwnerAndAccept {
		require(msg.pubkey() == tvm.pubkey(), 102);
		tvm.accept();
		_;
	}

    function newTask(string taskTitle) public checkOwnerAndAccept {
        key += 1;
        num += 1;
        taskKey[key] = task(taskTitle, now, false);
    }

    function list() public checkOwnerAndAccept returns (string[]) {
        for (uint8 i = 0; i < key; i++) {
            if (!(List.empty())) {
                  List.pop();
            }
        }
        for (uint8 i = 1; i <= key; i++) {
            List.push(taskKey[i].title);
        }
        return List;
    }

    function number() public checkOwnerAndAccept returns (uint8) {
        return num;
    }

    function thisTask(uint8 numKeyTask) public checkOwnerAndAccept returns (task) {
        return taskKey[numKeyTask];
    }

    function del(uint8 numKeyTask) public checkOwnerAndAccept {
        delete taskKey[numKeyTask];
    }

    function Done(uint8 numKeyTask) public checkOwnerAndAccept {
        taskKey[numKeyTask].done = true;
    }



}
