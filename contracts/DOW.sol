// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;
contract DOW {


uint[] public computerNumber;
uint[] playerNumber;
uint omega;


function randomNumber () public returns(uint){
    uint mod = 10;
    omega += 1 ;
    return uint(keccak256(abi.encodePacked(block.timestamp, omega, msg.sender))) % mod;
}

function clearArray() private {
    while(computerNumber.length > 0){
      computerNumber.pop();
    }
}

function startGame() public returns(uint[] memory){
    clearArray();

    while (computerNumber.length < 4){
      uint _rand = randomNumber();
      bool matches = false;
      for(uint i = 0; i < computerNumber.length; i++){
        if(computerNumber[i] == _rand){
          matches = true;
          break;
        }
      }
      if (!matches){
        computerNumber.push(_rand);
      }
    }
    return computerNumber;  
}


}

