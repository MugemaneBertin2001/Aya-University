async function main() {
  const Crowdfunding = await ethers.getContractFactory("Crowdfunding");
  const crowdfunding = await Crowdfunding.deploy(1000, 7); // Goal: 1000 wei, Duration: 7 days
  await crowdfunding.deployed();

  console.log("Crowdfunding deployed to:", crowdfunding.address);
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
