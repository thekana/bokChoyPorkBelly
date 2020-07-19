var MarketPlace = artifacts.require("MarketPlace");
var Resource = artifacts.require("Resource");
var ResourceManager = artifacts.require("ResourceManager");
var Merchant = artifacts.require("Merchant");

module.exports = function(deployer) {
  deployer.deploy(MarketPlace);
  // deployer.deploy(Resource);
  // deployer.deploy(ResourceManager);
  // deployer.deploy(Merchant);
}