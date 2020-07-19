// Allows us to use ES6 in our migrations and tests.
require('babel-register');
const HDWalletProvider = require("truffle-hdwallet-provider");

module.exports = {
  networks: {
    development: {
      host: '127.0.0.1',
      port: 7545,
      // from: '0xFeD0175D4467532B9EcD8175A13812c7357FCA3a',
      network_id: '*',
      // provider: () => new HDWalletProvider("b1bcb186bccb92c618491b0c5a7ae8db6557f3dd5ef79e20693be55b9a634b85", "http://localhost:7545"),
      
      
    },
    develop: {
      port: 7545
    }
  }
}
