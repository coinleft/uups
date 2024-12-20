// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import '@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol';
import '@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol';
import '@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol';

contract CounterV1 is Initializable, UUPSUpgradeable, OwnableUpgradeable {
    uint256 public number;

    constructor() {
        _disableInitializers();
    }

    function initialize(address initialOwner) public initializer {
        __UUPSUpgradeable_init();
        __Ownable_init(initialOwner);
        number = 1688;
    }

    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }

    function getVersion() public pure virtual returns(string memory) {
        return 'v1.0.0';
    }
}
