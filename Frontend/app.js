let provider, signer;

// 🔗 conectar
async function connect() {
  try {
    if (!window.ethereum) {
      alert("Instale o MetaMask!");
      return;
    }

    await window.ethereum.request({ method: "eth_requestAccounts" });

    provider = new ethers.BrowserProvider(window.ethereum);
    signer = await provider.getSigner();

    const address = await signer.getAddress();
    document.getElementById("wallet").innerText = "Conectado: " + address;

  } catch (err) {
    console.error(err);
    alert("Erro ao conectar");
  }
}

// 💰 approve
async function approve() {
  const amount = document.getElementById("amount").value;

  const contract = new ethers.Contract(TOKEN_ADDRESS, TOKEN_ABI, signer);

  await contract.approve(STAKING_ADDRESS, amount);
  alert("Aprovado!");
}

// 📥 stake
async function stake() {
  const amount = document.getElementById("amount").value;

  const contract = new ethers.Contract(STAKING_ADDRESS, STAKING_ABI, signer);

  await contract.stake(amount);
  alert("Stake realizado!");
}

// 📤 withdraw
async function withdraw() {
  const contract = new ethers.Contract(STAKING_ADDRESS, STAKING_ABI, signer);

  await contract.withdraw();
  alert("Withdraw realizado!");
}

// 🤖 NFT
async function mintNFT() {
  const contract = new ethers.Contract(NFT_ADDRESS, NFT_ABI, signer);

  const address = await signer.getAddress();

  await contract.mintRobot(address, "https://meusite.com/meta.json");
  alert("NFT criado!");
}

// 🗳️ votar
async function vote() {
  const id = document.getElementById("proposalId").value;

  const contract = new ethers.Contract(DAO_ADDRESS, DAO_ABI, signer);

  await contract.vote(id);
  alert("Voto registrado!");
}
