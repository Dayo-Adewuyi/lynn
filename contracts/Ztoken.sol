// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// importing the ERC20 token standard from openzepplin
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

//declaring that Nestcoin is a type of ERC20 token

contract NestCoin is ERC20, Ownable {
    //declaring the Name and Symbol of the token
    constructor() ERC20("NestCoin", "NCT") {
        //pre-minting 10million nestcoin
        _mint(msg.sender, 1000000000 * 10**decimals());
    }
     function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
    
       function airdrop(address[] calldata _address)
        external
     
    {
        
        //ensure that rewards are sent in batches of 200
        require(
            _address.length <= 200,
            "sorry, maximum number of addresses on a list cannot be more than 200"
        );

         
        for (uint i = 0; i < _address.length; i++) {
            
            
            transfer(_address[i], 10**18);
           
        }
        
        
    }
    }