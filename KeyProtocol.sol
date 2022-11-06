// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract nftVault{

    address nft_cont_addr;

    constructor(address _addr) payable {
        nft_cont_addr = _addr;
    }
    receive() external payable{}
}

contract KeyProtocol{

    constructor() payable{}

    uint i=0;

    nftVault[] public _nftvaults;

    event VaultCreated(
        uint date,
        address vault_addr,
        address nft_addr
    );

    mapping (address=> uint) map;

    receive() external payable{}

    function createVault(address addr) public{
        nftVault vault = (new nftVault){value: 200}(addr);
        _nftvaults.push(vault);

        i++;

        emit VaultCreated(block.timestamp,address(vault),addr);

        map[addr] = i;
    }   
}
/*  
    function addEtherTovault(address payable _to) payable external{
        bool sent = _to.send(123);
        require(sent, "send failed");
    }

    function returnVaultAddress(address nft_contractaddr) public payable returns(address) {
        return address(_nftvaults[map[nft_contractaddr]]);
    }

    //Transfer ERC20 token from sender address to contract address
    //address private ZERO_ADDRESS = 0x0000000000000000000000000000000000000000;
    function depositERC20Token(address nft_contractaddr, address token_addr, uint256 amount) external {

        require(token_addr != ZERO_ADDRESS, "token is not registered into the platform");

        require(IERC20(token_addr).approve(msg.sender, amount) == true,
        "tokens can not be transferred without approval"); 

        IERC20(token_addr).transferFrom(msg.sender, address(_nftvaults[map[nft_contractaddr]]), amount);
    }
    function addFundstoVault(address nft_contractaddr ,address token_addr, uint token_amount) public payable{
        nftVault _vault = _nftvaults[map[nft_contractaddr]];

        _vault.addfunds(msg.sender, token_addr, token_amount);
    }
    function depositTokens(address token_addr, uint256 amount) external {
        ERC20(token_addr).transferFrom(msg.sender, address(this), amount);
    }
    function addFunds(address nft_contractaddr ,address token_addr, uint token_amount) public payable{
        Token token = Token(token_addr);

        token.approve(msg.sender, token_amount);

        token.transferFrom(
            msg.sender,
            address(_nftvaults[map[nft_contractaddr]]),
            token_amount);
    }
Initialize
Claim + Burn
*/
