// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

// // EIP712 => signatures
// // permit allows you to call approve gasless.
// // permit accepts: owner, spender, value, dealine and VRS
// // VRS is the coupled version of the owner's signature in bytes
// // v => uint8
// // r=> bytes32
// // s=> 32bytes
// // each resullting signature is 65bytes

// contract sliceVRS {
//     bytes storage signature = 0x14280e5885a19f60e536de50097e96e3738c7acae4e9e62d67272d794b8127d31c03d9cd59781d4ee31fb4e1b893bd9b020ec67dfa65cfb51e2bdadbb1de26d91c;
//     function slice() external returns (bytes4 r){
//         assembly{
//             r := mload(add(signature, 0x4))
//         }
//     }
// }