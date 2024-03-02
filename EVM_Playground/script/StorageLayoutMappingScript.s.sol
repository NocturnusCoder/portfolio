// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.23;

import {Script, console} from "forge-std/Script.sol";
import {StorageLayoutMapping} from "../src/StorageLayoutMapping.sol";

contract StorageLayoutMappingScript is Script {
    function setUp() public {}

    function run() public {
        vm.broadcast();
    }
}
