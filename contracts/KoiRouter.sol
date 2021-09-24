// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import "./multi-token-standard/interfaces/IERC1155.sol";
import "./KoiToken.sol";

interface IKoiToken {
    function burnFrom(
        address _from,
        uint256 _id,
        uint256 _quantity
    ) external;
}
/**
 * @notice KoiRouter contract
 */
contract KoiRouter {
    // Events
    event Deposit(address user, address token, uint256 id, uint256 amount, string arAddress);

    // Storage
    address public koiToken;
    address public vault;

    constructor(address _koiToken, address _vault) {
        koiToken = _koiToken;
        vault = _vault;
    }

    function deposit(
        address token,
        uint256 id,
        uint256 amount,
        string calldata arAddress
    ) external {
        
            
            IERC1155(token).safeTransferFrom(
                msg.sender,
                vault,
                id,
                amount,
                "0x"
            );
        

        emit Deposit(msg.sender, token, id, amount,arAddress);
    }
}
