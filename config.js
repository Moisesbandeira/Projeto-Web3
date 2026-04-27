// Endereços dos contratos
const TOKEN_ADDRESS   = "0xaD1373A1ab022b3b4D648f783772ddA462AEE447";
const STAKING_ADDRESS = "0x964F7b0e25142867A92627ffD929ecBfAe6cd9A1";
const NFT_ADDRESS     = "0x21712Fde42d4D8dD30B37BdF2628628dd77B23c8";
const DAO_ADDRESS     = "0xeDF0f9781eEDF5d62795cc84f4c8aD0b484c1ED3";


// ABIs mínimas
const TOKEN_ABI = [
  "function approve(address spender, uint256 amount)"
];

const STAKING_ABI = [
  "function stake(uint256 amount)",
  "function withdraw()"
];

const NFT_ABI = [
  "function mintRobot(address to, string memory uri)"
];

const DAO_ABI = [
  "function vote(uint256 proposalId)"
];