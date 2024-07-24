// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MentesMejorando is ERC721
     {
     uint256 public tokenCounter = 0;

     string public theSender;

     struct NFTMetadata  
     {
          string imageURL;
          string walletId;
          string kitAmount;
     }

     mapping(uint256 => NFTMetadata) private nfts;

     mapping(uint256 => address) private _owners;

     constructor() ERC721("MentesMejorando", "MMARG")
     {
          // tokenCounter = 0;
     }

     function createCollectible() public returns (uint256) 
     {
          tokenCounter++;
          nfts[tokenCounter] = NFTMetadata({ imageURL: "https://fundacionoidmortales.org/wp-content/uploads/sites/15/2024/06/Libro-Mentes-Mejorando.png", walletId: theSender, kitAmount: "1" }); 
          _safeMint(msg.sender, tokenCounter);
          _owners[tokenCounter] = msg.sender;
          return tokenCounter;
     }

     function setProperty(string memory newWalletId) public 
     {
          require(_owners[tokenCounter] == msg.sender, "You are not the owner of this NFT");
          
          nfts[tokenCounter].walletId = newWalletId;
     }

     function getProperty(uint256 tokenId) public view returns (string memory, string memory)
     {
          require(_owners[tokenId] != address(0), "Token does not exist");
          
          return (nfts[tokenId].walletId, nfts[tokenId].kitAmount);
     }
}
