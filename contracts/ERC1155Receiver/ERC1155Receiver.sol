// SPDX-License-Identifier: MIT

pragma solidity 0.8.9;

import "hardhat/console.sol";

/**
 * Working implementation of ERC1155Receiver.
 */
contract ERC1155Receiver {
    function onERC1155Received(
        address operator,
        address from,
        uint256 id,
        uint256 value,
        bytes calldata data
    ) external returns (bytes4) {
        console.log("----- onERC1155Received: ");
        console.logBytes(msg.data);

        return
            bytes4(
                keccak256(
                    "onERC1155Received(address,address,uint256,uint256,bytes)"
                )
            );
    }

    function onERC1155BatchReceived(
        address operator,
        address from,
        uint256[] calldata ids,
        uint256[] calldata values,
        bytes calldata data
    ) external returns (bytes4) {
        console.log("----- onERC1155BatchReceived: ");
        console.logBytes(msg.data);

        return
            bytes4(
                keccak256(
                    "onERC1155BatchReceived(address,address,uint256[],uint256[],bytes)"
                )
            );
    }

    fallback() external payable {
        console.log("----- fallback: ");
        console.logBytes(msg.data);
    }

    receive() external payable {
        console.log("----- receive:", msg.value);
    }
}
/**

0000000000000000000000000000000000000000000000000000000000000000

0x
bc197c81
00000000000000000000000070997970c51812dc3a010c7d01b50e0d17dc79c8
00000000000000000000000070997970c51812dc3a010c7d01b50e0d17dc79c8
00000000000000000000000000000000000000000000000000000000000000a0
0000000000000000000000000000000000000000000000000000000000000120
00000000000000000000000000000000000000000000000000000000000001a0
0000000000000000000000000000000000000000000000000000000000000003
00000000000000000000000000000000000000000000000000000000000007d0
00000000000000000000000000000000000000000000000000000000000007da
00000000000000000000000000000000000000000000000000000000000007e4
0000000000000000000000000000000000000000000000000000000000000003
0000000000000000000000000000000000000000000000000000000000000123
0000000000000000000000000000000000000000000000000000000000000123
0000000000000000000000000000000000000000000000000000000000000123
0000000000000000000000000000000000000000000000000000000000000004
0000000000000000000000000000000000000000000000000000000000000069
0000000000000000000000000000000000000000000000000000000000000069
0000000000000000000000000000000000000000000000000000000000000069
0000000000000000000000000000000000000000000000000000000000000069

 */
