// SPDX-License-Identifier: MIT
pragma solidity >=0.4.4 <0.7.0;
pragma experimental ABIEncoderV2;
import "./ERC20.sol";

contract Loteria {
    ERC20Basic private token;
    address public owner;
    address public contrato;
    uint public numTokensCreated = 10000;

    constructor() public {
        token = new ERC20Basic(numTokensCreated);
        owner = msg.sender;
        contrato = address(this);
    }

    function getTokensPrice(uint _numTokens) internal pure returns(uint) {
        return _numTokens * (0.05 ether);
    }

    function addTokens(uint _numTokens) public isOwner(msg.sender) {
        token.increaseTotalSupply(_numTokens);
    }

    function getBalance() public view returns(uint) {
        return token.totalSupply();
    }

    modifier isOwner(address _direccion) {
        require(owner == _direccion, "Usted no tiene permisos para esta función");
        _;
    }
}