// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./AbstractERC20.sol";

contract nftVault{

    address cont_addr;
    constructor(address _addr){
        cont_addr = _addr;
    }
/*
    function addfunds(address msg_sender ,address token_addr, uint token_amount) payable public{
        Token token = Token(token_addr);

        token.approve(msg.sender, token_amount);

        token.transferFrom(
            msg_sender,
            address(this),
            token_amount);
    }
*/

//Addvalue: Done 
//Check Value

}
