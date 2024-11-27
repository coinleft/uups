// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import '@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol';
import {CounterV1} from "../src/CounterV1.sol";

contract CounterScript is Script {
    CounterV1 public counterV1;
    // set up your EOA address 
    address owner = 0x123;
    function setUp() public {}

    function run() public {
        uint256 privateKey = vm.envUint("KEY");
        vm.startBroadcast(privateKey);

        counterV1 = new CounterV1();
        bytes memory data = abi.encodeCall(CounterV1.initialize, (owner));
        ERC1967Proxy proxy = new ERC1967Proxy(address(counterV1), data);

        vm.stopBroadcast();

        CounterV1 proxyCounter = CounterV1(address(proxy));
        console.log(proxyCounter.getVersion());

        console.log("Logic contract deployed at:", address(counterV1));
        console.log("Proxy contract deployed at:", address(proxy));
    }
}
