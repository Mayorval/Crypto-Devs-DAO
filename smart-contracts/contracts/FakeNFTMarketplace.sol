//SPDX-License-Identifier: MIT

//FakeNFTMarketplace deployed to:  0x6B8Dd47B8c93b3B51B92E7B68438d3723d1e8A58
pragma solidity ^0.8.0;

contract FakeNFTMarketplace {
    ///@dev Maintain a mapping of fake TokenID to owner addresses
    mapping(uint256 => address) public tokens;
    ///@dev Set the purchase price for each Fake NFT
    uint256 nftPrice = 0.1 ether;

    ///@dev purchase accepts ETH and marks the owner of the given tokenId to the caller address
    ///@param _tokenId- the fake NFT token Id to purchase
    function purchase(uint256 _tokenId) external payable {
        require(msg.value == nftPrice, "This NFT costs 0.1 ether");
        tokens[_tokenId] = msg.sender;
    }

    ///@dev getPrice() returns the price of one NFT
    function getPrice() external view returns (uint256) {
        return nftPrice;
    }

    ///@dev available() checks if the given tokenId has already been sold or not
    ///@param _tokenId - the tokenId to check for
    function  available(uint _tokenId) external view returns (bool) {
        // address(0) = 0x0000000000000000000000000000000000000000
        // This is the default value for addresses in Solidity
        if(tokens[_tokenId] == address(0)) {
            return true;
        }
        return false;
    }
}