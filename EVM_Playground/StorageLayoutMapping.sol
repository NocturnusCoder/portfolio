//SPDX-License-Identifier: MIT
contract StorageLayoutMapping {
    uint256 x = 2;
    mapping(string => uint256) stringmapping;

    function addToStringMapping(string memory key, uint256 value) public {
        stringmapping[key] = value;
    }

    // HELPER TO READ FROM STORAGE SLOTS
    function readStorageSlot(uint256 i) public view returns (bytes32 content) {
        assembly {
            content := sload(i)
        }
    }

    // HELPER TO GET THE SLOT INDEX OF A MAPPING'S VALUE UNDER IT'S GIVEN KEY
    function getLocationOfStringMapping(uint256 mappingSlot, string memory key)
        public
        pure
        returns (bytes32 slot, bytes memory, bytes memory)
    {
        // mappingSlot: the slot that the mapping itself sits in -> here: it's slot 2
        // slot: the slot that the value will be sitting in, e.g.: m[key] = value --> value will sit in "slot."

        return (
            keccak256(abi.encodePacked(key, mappingSlot)),
            abi.encode(key, mappingSlot),
            abi.encodePacked(key, mappingSlot)
        );
        // return keccak256(abi.encode(key,mappingSlot)); this will not give the correct value

        // abi.encodePacked of mappingslot=1 and key="a", value=13 =>
        // uint(keccak256) of above number => 0xb5cafab5b83d18303877bb912b2d66ca18ab7390cfd9be8a2e66cc5096e0ea02
        // use this number as input to function readStorageSlot
    }
}
