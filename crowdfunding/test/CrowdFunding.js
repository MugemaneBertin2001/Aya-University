const { expect } = require("chai");

describe("Crowdfunding Contract", function () {
  let crowdfunding;

  before(async function () {
    const Crowdfunding = await ethers.getContractFactory("Crowdfunding");
    crowdfunding = await Crowdfunding.deploy(1000, 7);
    await crowdfunding.deployed();
  });

  it("Should set the owner and goal", async function () {
    expect(await crowdfunding.owner()).to.not.equal(ethers.constants.AddressZero);
    expect(await crowdfunding.goal()).to.equal(1000);
  });

  it("Should allow contributions", async function () {
    await crowdfunding.connect(signer).contribute({ value: ethers.utils.parseEther("0.1") });
    const balance = await crowdfunding.connect(signer).contributions(signer.address);
    expect(balance).to.equal(ethers.utils.parseEther("0.1"));
  });

  it("Should not allow contributions after the campaign ends", async function () {
    // Skip forward in time by 8 days (beyond campaign end)
    await network.provider.send("evm_increaseTime", [8 * 24 * 60 * 60]);
    await network.provider.send("evm_mine");
    await expect(crowdfunding.connect(signer).contribute({ value: ethers.utils.parseEther("0.1") }))
      .to.be.revertedWith("Crowdfunding has ended");
  });

  it("Should allow the owner to withdraw funds if the goal is reached", async function () {
    await crowdfunding.connect(signer).contribute({ value: ethers.utils.parseEther("1.0") });
    await crowdfunding.connect(signer).withdraw();
    const ownerBalance = await ethers.provider.getBalance(signer.address);
    expect(ownerBalance.gt(ethers.utils.parseEther("0.9"))).to.be.true;
  });

  it("Should not allow the owner to withdraw funds if the goal is not reached", async function () {
    await crowdfunding.connect(signer).contribute({ value: ethers.utils.parseEther("0.5") });
    await expect(crowdfunding.connect(signer).withdraw()).to.be.revertedWith("Goal not reached");
  });
});
