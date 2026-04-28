// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract GreenBotToken is ERC20, Ownable {

    mapping(address => bool) public authorized;

    constructor(address initialOwner)
        ERC20("GreenBot Token", "GBOT")
        Ownable(initialOwner)
    {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    function setAuthorized(address _addr, bool _status) external onlyOwner {
        authorized[_addr] = _status;
    }

    function mint(address to, uint256 amount) public {
        require(authorized[msg.sender], "Nao autorizado");
        _mint(to, amount);
    }
}
