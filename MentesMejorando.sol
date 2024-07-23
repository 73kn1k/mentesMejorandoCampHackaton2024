     // SPDX-License-Identifier: MIT
     pragma solidity ^0.8.20;

     import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

     contract MentesMejorando is ERC721
     {
     uint public tokenCounter;

     string public theSender;

          struct NFTMetadata  
          {
               string imageURL;
               string walletId;
               string kitAmount;
          }

          mapping(uint => NFTMetadata) private nfts;

          // This creates a public mapping with the key being the token ID (uint) and 
          // the value being the owner's address (address).
          mapping(uint256 => address) private _owners;

          constructor() ERC721("MentesMejorando", "MMARG")
          {
               tokenCounter = 0;
               nfts[tokenCounter] = NFTMetadata({ imageURL: "https://fundacionoidmortales.org/wp-content/uploads/sites/15/2024/06/Libro-Mentes-Mejorando.png", walletId: theSender, kitAmount: "1" }); 
          }

          function createCollectible() public returns (uint) 
          {
               _safeMint(msg.sender, tokenCounter);
               
               tokenCounter++;
               
               return tokenCounter;
          }

          function setProperty(string memory newWalletId) public 
          {
               require(_owners[tokenCounter] == msg.sender, "You are not the owner of this NFT");
               
               nfts[tokenCounter].walletId = newWalletId;
          }

          function getProperty(uint tokenId) public view returns (string memory, string memory)
          {
               require(_owners[tokenId] != address(0), "Token does not exist");
               
               return (nfts[tokenId].walletId, nfts[tokenId].kitAmount);
          }
     }
