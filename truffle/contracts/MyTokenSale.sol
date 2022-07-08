pragma solidity 0.6.1;

import "./Crowdsale.sol";
import "./KYC.sol";

contract MyTokenSale is Crowdsale {

    KYCContract kyc;

    constructor(
        uint256 rate,    // rate in TKNbits
        address payable wallet,
        IERC20 token,
        KYCContract _kyc
    )
        Crowdsale(rate, wallet, token)
        public
    {
        kyc = _kyc;
    }

    function _preValidatePurchase(address beneficiary, uint256 weiAmount) internal view override {
        super._preValidatePurchase(beneficiary, weiAmount);
        require(kyc.KYCCompleted(msg.sender), "KYC not completed. Purchase not allowed.");    
    }
}