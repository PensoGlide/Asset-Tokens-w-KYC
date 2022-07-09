pragma solidity 0.6.1;

import "../../client/node_modules/@openzeppelin/contracts/token/ERC20/ERC20Mintable.sol";
import "../../client/node_modules/@openzeppelin/contracts/token/ERC20/ERC20Detailed.sol";

contract MyToken is ERC20Mintable, ERC20Detailed {
    constructor(uint256 amount) public ERC20Detailed("Rasco Vosas' Soups", "RVS", 0) {
        mint(msg.sender, amount);
    }
}