// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract GreenBotDAO is Ownable {

    IERC20 public token;

    struct Proposal {
        string description;
        uint256 voteCount;
        uint256 deadline;
        bool executed;
    }

    Proposal[] public proposals;

    // Evita voto duplicado
    mapping(uint256 => mapping(address => bool)) public hasVoted;

    constructor(address _token) Ownable(msg.sender) {
        token = IERC20(_token);
    }

    // 📌 Criar proposta (modelo de robô)
    function createProposal(string memory _description, uint256 duration) public onlyOwner {
        proposals.push(Proposal({
            description: _description,
            voteCount: 0,
            deadline: block.timestamp + duration,
            executed: false
        }));
    }

    // 📌 Votar usando tokens
    function vote(uint256 proposalId) public {
        Proposal storage proposal = proposals[proposalId];

        require(block.timestamp < proposal.deadline, "Votacao encerrada");
        require(!hasVoted[proposalId][msg.sender], "Ja votou");

        uint256 votingPower = token.balanceOf(msg.sender);
        require(votingPower > 0, "Sem poder de voto");

        proposal.voteCount += votingPower;
        hasVoted[proposalId][msg.sender] = true;
    }

    // 📌 Ver proposta vencedora
    function getWinningProposal() public view returns (uint256 winningId) {
        uint256 highest = 0;

        for (uint256 i = 0; i < proposals.length; i++) {
            if (proposals[i].voteCount > highest) {
                highest = proposals[i].voteCount;
                winningId = i;
            }
        }
    }

    // 📌 Executar decisão (define robô vencedor)
    function executeProposal(uint256 proposalId) public onlyOwner {
        Proposal storage proposal = proposals[proposalId];

        require(block.timestamp >= proposal.deadline, "Ainda em votacao");
        require(!proposal.executed, "Ja executada");

        proposal.executed = true;

        // Aqui você pode integrar com produção real ou evento
    }
}
