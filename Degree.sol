pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/SafeERC721.sol";

contract SchoolDegrees is SafeERC721 {
  // Mapping to keep track of the degree information for each NFT
  mapping(uint256 => (string memory, string memory, string memory)) public degreeInfo;

  constructor() public {
    // Set the name and symbol of the NFT
    name = "School Degrees";
    symbol = "DEG";
  }

  // Function to create a new School Degree NFT
  function createDegree(
    uint256 _tokenId,
    string memory _degree,
    string memory _school,
    string memory _year
  ) public {
    // Create the NFT
    _mint(_msgSender(), _tokenId);

    // Store the degree information
    degreeInfo[_tokenId] = (_degree, _school, _year);
  }

  // Function to update the degree information for a given NFT
  function updateDegreeInfo(
    uint256 _tokenId,
    string memory _degree,
    string memory _school,
    string memory _year
  ) public {
    // Only the owner of the NFT can update its information
    require(_isApprovedOrOwner(msg.sender, _tokenId), "Only the owner of the NFT can update its information");

    // Update the degree information
    degreeInfo[_tokenId] = (_degree, _school, _year);
  }

  // Function to transfer an NFT to another user
  function transferDegree(
    address _to,
    uint256 _tokenId
  ) public {
    // Only the owner of the NFT can transfer it
    require(_isApprovedOrOwner(msg.sender, _tokenId), "Only the owner of the NFT can transfer it");

    // Transfer the NFT
    _transfer(_to, _tokenId);
  }

  // Function to get the degree information for a given NFT
  function getDegreeInfo(uint256 _tokenId) public view returns (string memory, string memory, string memory) {
    // Return the degree information
    return degreeInfo[_tokenId];
  }
}
