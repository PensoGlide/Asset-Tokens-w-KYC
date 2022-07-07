pragma solidity 0.6.1;

import "../../client/node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "../../client/node_modules/@openzeppelin/contracts/token/ERC20/ERC20Detailed.sol";

contract MyToken is ERC20, ERC20Detailed {
    constructor(uint256 initialSupply) public ERC20Detailed("Rasco Vosas' Soups", "RVS", 0) {
        _mint(msg.sender, initialSupply);
    }
}