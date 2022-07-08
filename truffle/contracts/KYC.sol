pragma solidity 0.6.1;

import "../../client/node_modules/@openzeppelin/contracts/ownership/Ownable.sol";

contract KYCContract is Ownable {
    mapping(address => bool) allowed;

    function setKYCCompleted(address _addr) public onlyOwner {
        allowed[_addr] = true;
    }

    function setKYCRevoked(address _addr) public onlyOwner {
        allowed[_addr] = false;
    }

    function KYCCompleted(address _addr) public view returns(bool) {
        return allowed[_addr];
    }
}