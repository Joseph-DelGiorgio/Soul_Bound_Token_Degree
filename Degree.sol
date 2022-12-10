pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract SchoolDegrees is ERC721 {
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
        // Check if the token ID is not already taken
        require(!exists(_tokenId), "Token ID already exists");

        // Create the NFT
        mint(_tokenId);

        // Store the degree information
        degreeInfo[_tokenId] = (_degree, _school, _year);
    }

    // Function to get the degree information for a given NFT
    function getDegreeInfo(uint256 _tokenId) public view returns (string memory, string memory, string memory) {
        // Return the degree information
        return degreeInfo[_tokenId];
    }
}
