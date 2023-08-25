const Crowdfunding = await ethers.getContractFactory("Crowdfunding");
const crowdfunding = await Crowdfunding.attach("<deployed_contract_address>");

await crowdfunding.contribute({ value: ethers.utils.parseEther("0.1") }); // Contribute 0.1 ether
await crowdfunding.getBalance(); // Get contract balance
await crowdfunding.withdraw(); // Withdraw funds after campaign ends
