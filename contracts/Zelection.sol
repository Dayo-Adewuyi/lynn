// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

interface IZtoken {
    /// @dev balanceOf returns the number of token owned by the given address
    /// @param owner - address to fetch number of token for
    /// @return Returns the number of tokens owned
    function balanceOf(address owner) external view returns (uint256);
}

contract Zelection {
    constructor(address _ztoken) {
        ztoken = IZtoken(_ztoken);
    }

    IZtoken ztoken;

    function vote() public {
        uint balance = ztoken.balanceOf(msg.sender);
        require(balance > 0, "only stakeholders can vote in election");
    }
}
