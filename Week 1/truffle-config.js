module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545, // Or the port where Ganache is running
      network_id: "*", // Match any network id
    },
  },
};
