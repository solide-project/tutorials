// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "solmate/src/utils/CREATE3.sol";
import "./Ownerable.sol";

contract Deployer {
    function deploy(bytes memory _salt, uint256 _value) external {
        bytes memory bytecode = abi.encodePacked(
            type(Ownerable).creationCode,
            abi.encode(msg.sender)
        );

        CREATE3.deploy(keccak256(_salt), bytecode, _value);
    }

    function getDeployed(bytes memory _salt) public view returns (address) {
        return CREATE3.getDeployed(keccak256(_salt));
    }
}
