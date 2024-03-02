//SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/console.sol";

import {StorageLayoutMapping} from "../src/StorageLayoutMapping.sol";

contract StLayoutMappingTest is Test {
    string string1 = "someString1";
    string string2 = "someString2";
    uint256 number1 = 123;
    uint256 number2 = 456;

    StorageLayoutMapping SLMapping;

    function setUp() public {
        SLMapping = new StorageLayoutMapping();
    }

    function testreadStorageSlot() public {
        SLMapping.addToStringMapping(string1, number1);
        (bytes32 theSlot,,) = SLMapping.getLocationOfStringMapping(1, string1);
        emit log_named_bytes32("Slot no in hex         :", (theSlot));
        emit log_named_uint("Slot no in dec         :", uint256(theSlot));
        console.log();

        bytes32 theContent = SLMapping.readStorageSlot(uint256(theSlot));
        emit log_named_bytes32("the content of the slot in hex   :", (theContent));
        emit log_named_uint("the content of the slot in dec   :", uint256(theContent));

        assertEq(number1, uint256(theContent));
    }
}
