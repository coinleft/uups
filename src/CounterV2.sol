// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import './CounterV1.sol';
contract CounterV2 is CounterV1 {

    function getVersion() public pure override returns(string memory) {
        return 'v2.0.0';
    }
}
