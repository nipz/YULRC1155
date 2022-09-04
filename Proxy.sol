// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

interface IYULRC1155 {
    function balanceOf(address, uint256) external returns (uint256);

    function balanceOfBatch(address[] calldata, uint256[] calldata) external;

    function setApprovalForAll(address, bool) external;

    function isApprovedForAll(address, address) external;

    function safeTransferFrom(
        address,
        address,
        uint256,
        uint256,
        bytes calldata
    ) external;

    function safeBatchTransferFrom(
        address,
        address,
        uint256[] calldata,
        uint256[] calldata,
        bytes calldata
    ) external;
}

contract Proxy {
    IYULRC1155 public yulContract;

    constructor(address contractAddress) {
        yulContract = IYULRC1155(contractAddress);
    }

    function balanceOf(address account, uint256 id) external returns (uint256) {
        return yulContract.balanceOf(account, id);
    }

    function balanceOfBatch(address[] calldata accounts, uint256[] calldata ids)
        external
    {
        return yulContract.balanceOfBatch(accounts, ids);
    }

    function setApprovalForAll(address operator, bool approved) external {
        return yulContract.setApprovalForAll(operator, approved);
    }

    function isApprovedForAll(address account, address operator) external {
        return yulContract.isApprovedForAll(account, operator);
    }

    function safeTransferFrom(
        address from,
        address to,
        uint256 id,
        uint256 amount,
        bytes calldata data
    ) external {
        return yulContract.safeTransferFrom(from, to, id, amount, data);
    }

    function safeBatchTransferFrom(
        address from,
        address to,
        uint256[] calldata ids,
        uint256[] calldata amounts,
        bytes calldata data
    ) external {
        return yulContract.safeBatchTransferFrom(from, to, ids, amounts, data);
    }
}