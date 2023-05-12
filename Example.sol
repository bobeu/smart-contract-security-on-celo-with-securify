pragma solidity ^0.6.0;
    contract ExampleWallet {
        
        bytes32 hash;
        
        function makeCommit(bytes32 _hash) public payable {
            require(msg.value > 0 && hash == 0x0);
            hash = _hash;
        }
        
        function retrieveFund(bytes32 _text) public {
            require(keccak256(abi.encodePacked(_text)) == hash);
            msg.sender.transfer(address(this).balance);
        }
        
        function getHash(bytes32 _text) public pure returns (bytes32) {
            return keccak256(abi.encodePacked(_text));
        }
    }