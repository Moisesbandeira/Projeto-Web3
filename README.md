🌱 GreenBot Protocol - Web3 MVP

Este repositório contém o código-fonte do GreenBot Protocol, um ecossistema descentralizado desenvolvido como projeto final da Residência em TIC 29. O protocolo integra governança, ativos digitais e incentivos financeiros para promover a fabricação de robôs utilizando plástico 100% reciclado.  
📋 Visão Geral

O GreenBot combina a transparência da blockchain com a sustentabilidade ambiental. Através deste protocolo, a comunidade pode decidir quais modelos de robôs serão produzidos, enquanto os apoiadores recebem recompensas financeiras e digitais (NFTs) pelo seu engajamento.  
🛠️ Tecnologias Utilizadas

    Smart Contracts: Solidity (^0.8.20).  

    Bibliotecas: OpenZeppelin (ERC-20, ERC-721, Ownable, ReentrancyGuard).  

    Frontend: HTML5, CSS3 e JavaScript (Ethers.js v6).  

    Blockchain: Deploy realizado na Testnet Ethereum (Sepolia).  

🏗️ Arquitetura do Protocolo

O ecossistema é composto por quatro contratos principais:

    GreenBotToken (GBOT): Token utilitário ERC-20 para votação e recompensas.  

    GreenBotDAO: Sistema de governança onde 1 token equivale a 1 voto para decidir novos modelos de produção.  

    GreenBotStaking: Contrato que permite aos usuários travar tokens para receber rendimentos e bônus em NFT.  

    GreenBotNFT: Representação digital única de cada robô físico fabricado com plástico reciclado.  

🚀 Funcionalidades

    Conexão de Carteira: Integração total com MetaMask via Ethers.js.

    Governança Ativa: Criação e votação em propostas de modelos de robôs.  

    Sistema de Staking: Cálculo de recompensas baseado no tempo de permanência.  

    Mint de Ativos: Emissão de NFTs condicionada à produção física ou fidelidade no staking.  

🔧 Como Executar o Projeto

    Pré-requisitos:

        Navegador com extensão MetaMask instalada.

        Tokens de teste (Sepolia ETH e GBOT).

    Instalação:
    Bash

    git clone https://github.com/seu-usuario/greenbot-protocol.git
    cd greenbot-protocol

    Configuração:

        Os endereços dos contratos já estão pré-configurados no arquivo config.js.

        Certifique-se de que sua MetaMask está conectada à rede Sepolia.

    Uso:

        Abra o arquivo index.html em seu navegador.

        Conecte sua wallet, aprove o gasto de tokens e participe do staking ou das votações.

🛡️ Segurança

O protocolo foi desenvolvido seguindo as melhores práticas de segurança Web3:

    Uso de ReentrancyGuard para evitar ataques de reentrada.  

    Controle de acesso rigoroso com Ownable.  

    Verificações matemáticas nativas do Solidity 0.8.x.
