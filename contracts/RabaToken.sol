// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract RabaToken is ERC20, Ownable {

    uint public rate;  //= 1000 * 10 ** decimals();
    uint FixedSupply ;

    
    constructor() ERC20("RabaToken", "RTK") {
        rate = 10000;
        FixedSupply = 1000000 * 10 ** decimals();
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }


function buyToken(address to) public payable {

    require(msg.value >= 0, "You can not mint with zero Eth");

    uint256 amountToBuy = msg.value * rate;
    require(FixedSupply >= (totalSupply() + amountToBuy), "Cannot exceed fixed supply");
    _mint(to, amountToBuy);
    

}
}