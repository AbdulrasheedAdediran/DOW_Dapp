import { ethers } from "hardhat";

function sliceBytes() {
  const r = ethers.utils.hexDataSlice(
    "0x14280e5885a19f60e536de50097e96e3738c7acae4e9e62d67272d794b8127d31c03d9cd59781d4ee31fb4e1b893bd9b020ec67dfa65cfb51e2bdadbb1de26d91c",
    0,
    32
  );

  const s = ethers.utils.hexDataSlice(
    "0x14280e5885a19f60e536de50097e96e3738c7acae4e9e62d67272d794b8127d31c03d9cd59781d4ee31fb4e1b893bd9b020ec67dfa65cfb51e2bdadbb1de26d91c",
    32,
    64
  );

  const v = ethers.utils.hexDataSlice(
    "0x14280e5885a19f60e536de50097e96e3738c7acae4e9e62d67272d794b8127d31c03d9cd59781d4ee31fb4e1b893bd9b020ec67dfa65cfb51e2bdadbb1de26d91c",
    64,
    65
  );
  const y = Number(v.toString());
  const z = ethers.utils.splitSignature(
    "0x14280e5885a19f60e536de50097e96e3738c7acae4e9e62d67272d794b8127d31c03d9cd59781d4ee31fb4e1b893bd9b020ec67dfa65cfb51e2bdadbb1de26d91c"
  );
  return { y, r, s, z };
}
console.log(sliceBytes());
