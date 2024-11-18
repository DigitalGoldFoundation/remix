// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Blackcoin is ERC20, Ownable {
    uint256 public constant MAX_SUPPLY = 100_000_000 * 10 ** 6; // 100M tokens with 6 decimals

    constructor() ERC20("Blackcoin", "BLK") Ownable(msg.sender) { }

    function decimals() public view virtual override returns (uint8) {
        return 6;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        require(totalSupply() + amount <= MAX_SUPPLY, "Minting would exceed max supply");
        _mint(to, amount);
        // emit TokensMinted(to, amount); // If custom event is added
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
        // emit TokensBurned(msg.sender, amount); // If custom event is added
    }
}
