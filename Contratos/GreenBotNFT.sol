// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

//Bibliotecas openzeppelin
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

/**
 * @title GreenBotNFT
 * @dev Representa o robô físico feito de plástico reciclado.
 */
contract GreenBotNFT is ERC721URIStorage, Ownable, ReentrancyGuard {
    uint256 private _nextTokenId;

    // Evento para rastrear a criação do robô
    event RobotMinted(address indexed owner, uint256 indexed tokenId, string uri);

    constructor(address initialOwner) 
        ERC721("GreenBot Physical", "RBOT") 
        Ownable(initialOwner) 
    {}

    /**
     * @dev Etapa 2 e 5: Mint do NFT.
     * Apenas o dono da fábrica (você) pode mintar após a produção física.
     */
    function mintRobot(address to, string memory uri) public onlyOwner nonReentrant {
        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);

        emit RobotMinted(to, tokenId, uri);
    }
}
