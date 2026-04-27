// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
import "Projeto Final web3/GreenBotStaking.sol";

interface IToken {
    function mint(address to, uint256 amount) external;
}

interface INFT {
    function mintRobot(address to, string memory uri) external;
}

contract GreenBotStaking is ReentrancyGuard {

    IERC20 public token;
    IToken public rewardToken;
    INFT public nft;

    struct Stake {
        uint256 amount;
        uint256 timestamp;
    }

    mapping(address => Stake) public stakes;

    constructor(address _token, address _nft) {
        token = IERC20(_token);
        rewardToken = IToken(_token);
        nft = INFT(_nft);
    }

    // 📌 Stake
    function stake(uint256 amount) external nonReentrant {
        require(amount > 0, "Valor invalido");

        token.transferFrom(msg.sender, address(this), amount);

        stakes[msg.sender] = Stake({
            amount: stakes[msg.sender].amount + amount,
            timestamp: block.timestamp
        });
    }

    // 📌 Calculo de recompensa
    function calculateReward(address user) public view returns (uint256) {
        Stake memory s = stakes[user];
        if (s.amount == 0) return 0;

        uint256 time = block.timestamp - s.timestamp;

        return (time * s.amount) / 1 days; // simplificado
    }

    // 📌 Withdraw com recompensa
    function withdraw() external nonReentrant {
        Stake memory s = stakes[msg.sender];
        require(s.amount > 0, "Nada para sacar");

        uint256 reward = calculateReward(msg.sender);

        // 🔥 Minta recompensa
        rewardToken.mint(msg.sender, reward);

        // 🔥 NFT como bônus (se ficou tempo suficiente)
        if ((block.timestamp - s.timestamp) > 30 days) {
            nft.mintRobot(msg.sender, "https://meunft.com/robot.json");
        }

        token.transfer(msg.sender, s.amount);

        delete stakes[msg.sender];
    }
}