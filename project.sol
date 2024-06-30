// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "ERC20.sol";

contract Mtoken is ERC20 {
    address public owner = msg.sender;

    modifier onlyOwner { 
        require(owner == msg.sender, "Only owner can access");
        _;
    }

    constructor(string memory name, string memory symbol) ERC20(name, symbol) onlyOwner {
        // Mint 100 tokens to msg.sender
        _mint(msg.sender, 100 * 10**uint(decimals()));
    }

    function transferTokens(address recipient, uint256 amount) external {
        _transfer(msg.sender, recipient, amount);
    }

    function burnTokens(address account, uint256 amount) external onlyOwner {
        burn(account, amount);
    }
}
