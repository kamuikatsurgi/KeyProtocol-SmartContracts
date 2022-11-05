// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "./nftVault.sol";

contract KeyProtocol{
    uint i=0;

    nftVault[] public _nftvaults;

    event VaultCreated(
        uint date,
        address vault_addr,
        address nft_addr
    );

    mapping (address=> uint) map;

    function createVault(address addr) public{


        nftVault vault = new nftVault(addr);
        _nftvaults.push(vault);

        i++;

        emit VaultCreated(block.timestamp,address(vault),addr);

        map[addr] = i;
    }

    function addFunds(address nft_contractaddr ,address token_addr, uint token_amount) public {
        Token token = Token(token_addr);

        token.approve(msg.sender, token_amount);

        token.transferFrom(
            msg.sender,
            address(_nftvaults[map[nft_contractaddr]]),
            token_amount);
    }

    
// Initialize
//Claim + Burn
}