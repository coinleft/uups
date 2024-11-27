// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";

import '@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol';
import "../src/CounterV1.sol";
import "../src/CounterV2.sol";

contract UpgradeScript is Script {
    CounterV2 public counterV2;
    // Change to proxy contract address
    address proxyAddress = 0xfB4BD4EB730cB43F966A0851ba8F3de4c0bC9fF4;

    function setUp() public {}

    function run() public {
        uint256 privateKey = vm.envUint("KEY");
        vm.startBroadcast(privateKey);

        counterV2 = new CounterV2();
        console.log("Upgraded new implementation at:", address(counterV2));
        CounterV1(payable(proxyAddress)).upgradeToAndCall(address(counterV2), "");

        vm.stopBroadcast();

        CounterV2 proxyCounter = CounterV2(proxyAddress);
        console.log('Upgrade to new version: ', proxyCounter.getVersion());
    }
}
