var MyToken = artifacts.require("MyToken");
var MyTokenSale = artifacts.require("MyTokenSale");
var MyKYCContract = artifacts.require("KYCContract");
console.log("Working")

require("dotenv").config({path: "../../.env"});
//console.log(process.env);

module.exports = async function(deployer) {
    let addr = await web3.eth.getAccounts();
    await deployer.deploy(MyToken, process.env.INITIAL_TOKENS);
    await deployer.deploy(MyKYCContract);
    await deployer.deploy(MyTokenSale, 1, addr[0], MyToken.address, MyKYCContract.address);
    let instance = await MyToken.deployed();
    await instance.addMinter(MyTokenSale.address);
    await instance.transfer(MyTokenSale.address, process.env.INITIAL_TOKENS);
}