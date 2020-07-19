const contract = require('truffle-contract');
const HDWalletProvider = require("truffle-hdwallet-provider");

const metacoin_artifact = require('../build/contracts/MetaCoin.json');
var MetaCoin = contract(metacoin_artifact);

const marketplace_artifact = require('../build/contracts/MarketPlace.json');
var MarketPlace = contract(marketplace_artifact);

// let privateKeys = "b1bcb186bccb92c618491b0c5a7ae8db6557f3dd5ef79e20693be55b9a634b85";
// const wallet = new HDWalletProvider(privateKeys, "http://localhost:8545", 0, 2); //start at address_index 0 and load both addresses



module.exports = {
  connectMarketPlace: async function() {
    var self = this;
    console.log("AHHAHAHHAHAHAHHA");
    MarketPlace.setProvider(self.web3.currentProvider);
    // const mnemonic = "skin response depth banner lesson cool size ecology shed require cream end";
    // const provider = new HDWalletProvider(mnemonic, "http://localhost:7545");
    MarketPlace.setProvider(provider);
    var marketPlaceInstance = await MarketPlace.at("0xa82cdAd3135ADe3794a62B234b0989E943ddC789");
    var result = await marketPlaceInstance.getTest.call();
    // var result = await marketPlaceInstance.createResourceType.call("mask", 10, 640000);
    // var result = await marketPlaceInstance.createResourceType.call("handsan", 10, 640000);

    // registerMerchant(string memory _name, bool _isGov) public {
    // marketPlaceInstance.registerMerchant.call("Alice", false);
    // console.log("RESULT:", result)
    // res.send("DONE");

  },
  initializeData: async function() {



  },

  start: function(callback) {
    var self = this;

    // Bootstrap the MetaCoin abstraction for Use.
    MetaCoin.setProvider(self.web3.currentProvider);

    // Get the initial account balance so it can be displayed.
    self.web3.eth.getAccounts(function(err, accs) {
      if (err != null) {
        console.log("There was an error fetching your accounts.");
        return;
      }

      if (accs.length == 0) {
        console.log("Couldn't get any accounts! Make sure your Ethereum client is configured correctly.");
        return;
      }
      self.accounts = accs;
      self.account = self.accounts[0];

      callback(self.accounts);
    });
  },
  refreshBalance: function(account, callback) {
    var self = this;

    // Bootstrap the MetaCoin abstraction for Use.
    MetaCoin.setProvider(self.web3.currentProvider);

    var meta;
    MetaCoin.deployed().then(function(instance) {
      meta = instance;
      return meta.getBalance.call(account, {from: account});
    }).then(function(value) {
        callback(value.valueOf());
    }).catch(function(e) {
        console.log(e);
        callback("Error 404");
    });
  },
  sendCoin: function(amount, sender, receiver, callback) {
    var self = this;

    // Bootstrap the MetaCoin abstraction for Use.
    MetaCoin.setProvider(self.web3.currentProvider);

    var meta;
    MetaCoin.deployed().then(function(instance) {
      meta = instance;
      return meta.sendCoin(receiver, amount, {from: sender});
    }).then(function() {
      self.refreshBalance(sender, function (answer) {
        callback(answer);
      });
    }).catch(function(e) {
      console.log(e);
      callback("ERROR 404");
    });
  }
}
