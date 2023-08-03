# Lock Smart Contract - README

This repository contains the implementation and testing for the "Lock" smart contract using the Hardhat development environment.

## Features

The "Lock" smart contract has the following features:

1. **Locking Funds**: The contract allows the owner to lock funds for a specific duration by specifying the unlock time during contract deployment.

2. **Withdrawing Funds**: After the specified unlock time is reached, the contract owner can withdraw the locked funds.

## Running the Smart Contract

To run the "Lock" smart contract locally, follow these steps:

1. Install Dependencies: Make sure you have Node.js and npm installed on your machine. If not, download and install them from [here](https://nodejs.org).

2. Clone the Repository: Clone this repository to your local machine using the following command:

   ```bash
   git clone https://github.com/MugemaneBertin2001/Aya-University.git
   cd Aya-University
   cd "Week 3"
   ```

3. Install Hardhat: Install Hardhat globally using npm if you haven't already:

   ```bash
   npm install -g hardhat
   ```

4. Update Contract Parameters: Open the `hardhat.config.js` file and configure the network and other settings as needed.

5. Deploy the Contract: Deploy the "Lock" contract to the local Ethereum network using the following command:

   ```bash
   npx hardhat run scripts/deploy.js --network localhost
   ```

6. Interact with the Contract: Use the Hardhat console or write scripts to interact with the deployed "Lock" contract.

## Testing the Smart Contract

To run the tests for the "Lock" smart contract, follow these steps:

1. Open the `test/lock.js` file and make sure the unlock time is set to a future timestamp that suits your testing needs.

2. Run the Tests: Execute the test cases using the following command:

   ```bash
   npx hardhat test
   ```

   The test results will be displayed, showing if the contract functions as expected.

## Deployment to Ethereum Networks

To deploy the "Lock" smart contract to an Ethereum network, follow these steps:

1. Configure the Network: Open the `hardhat.config.js` file and add the configuration for the desired Ethereum network (e.g., Ropsten, Rinkeby, Mainnet).

2. Set the Deployment Parameters: If necessary, update the deployment parameters such as unlock time in the `scripts/deploy.js` file.

3. Deploy the Contract: Deploy the "Lock" contract to the desired Ethereum network using the following command:

   ```bash
   npx hardhat run scripts/deploy.js --network <network-name>
   ```

   Replace `<network-name>` with the name of the Ethereum network you want to deploy to.

4. Interact with the Deployed Contract: Once the contract is deployed, you can interact with it using its contract address and ABI.

