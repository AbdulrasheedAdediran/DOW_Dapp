import { ethers } from "hardhat";

async function main() {
  const Greeter = await ethers.getContractFactory("DOW");
  const greeter = await Greeter.deploy('0x73fDB6c756fEF146972eeB277373b1638cc6d215');

  await greeter.deployed();
  // await Greeter.claimFreeTokens()
  // console.log(await Greeter.balanceOf('0x30f9A9C1aA282508901b606DEA2D887D4dD072e8'))
  // console.log(await (await Greeter.startGame()).wait())

  console.log("DOW deployed to:", greeter.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
