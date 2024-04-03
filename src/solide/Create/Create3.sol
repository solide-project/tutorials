// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "solmate/utils/CREATE3.sol";
import "./Create3.sol";

contract Deployer {
    function deploy(bytes memory _salt, uint256 _value) external {
        bytes memory bytecode = abi.encodePacked(
            type(Ownerable).creationCode,
            abi.encode(msg.sender)
        );

        CREATE3.deploy(keccak256(_salt), bytecode, _value);
    }
}
