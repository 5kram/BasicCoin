

// SPDX-License-Identifier: MIT

pragma solidity 0.8.10;

contract BasicToken {
    address owner;
    mapping(address => uint256) balanceOf;

    constructor() {
        owner = msg.sender;
    }

    /**
     * @dev External function to mint tokens.
     */
    function mint(address _to, uint256 _amount) external {
        require(msg.sender == owner, "caller is not the owner of the contract");
        deposit();
    }

    /**
     * @dev External function to transfer tokens.
     */
    function transfer(address _from, address _to, uint256 _amount) external {
        withdraw(_from, _amount);
        deposit(_to, _amount);
    }

    /**
     * @dev External function to withdraw tokens.
     */
    function withdraw(address _addr, uint256 _amount) private {
        require(balances[_addr] >= _amount), "insufficient balance";
        balances[_addr] -= _amount;
    }

    /**
     * @dev External function to withdraw tokens.
     */
    function deposit(address _to, uint256 _amount) private {
        balances[_to] += _amount;
    }
}