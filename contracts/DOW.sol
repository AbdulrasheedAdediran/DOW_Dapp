// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;
contract DOW {
// Player vs computer
// Player picks 4 unique random numbers 0 - 9
// Validate uniqueness of player's numbers: return "Numbers must be unique" if numbers are not unique
// Computer picks 4 unique random numbers 0 - 9 (automatically generated)
// Numbers selected by comp will be stored in an array in the storage
// Numbers selected by player will be stored in an array in the memory
// When player guesses unique sequence of numbers, check index of opponent's selected numbers for matches
// If number(s) from sequence of guessed numbers match(es) opponent's selected numbers by index, return 'dead' indicator
// Else if sequence of guessed numbers is present in opponent's selected numbers but does not match index, return 'wounded' indicator
// Each player should only be allowed a maximum of 7 guesses per game
// Warning message when player has 3 guesses left
// Warning message when player has 1 guess left

// 3 diffulty levels: 
//  Easy     (Less liklihood of computer guessing right)
//  Medium   (Moderate liklihood of computer guessing right)
//  Hard     (High liklihood of computer guessing right)
//

uint256[] computerNumber;

function randModulus () internal view returns(uint){
    uint mod = 10;
   return uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty, msg.sender))) % mod;
    
}

function startGame () public returns(uint[] memory){
    while (computerNumber.length < 4) {
    uint256 filter = 0;
    uint256 randomNum = randModulus();
    for (uint8 i = 0; i < computerNumber.length; i++) {
      if (computerNumber[i] == randomNum) {
        filter++;
      }
    }
    if (filter == 0) {
      computerNumber.push(randomNum);
    }
  }
 return computerNumber;
}


// function generateComputerNumbers() public returns(uint[] memory){

// }

// function playerNumber(uint num1, uint num2, uint num3, uint num4) public{
// // uint256[4] playerNumber;
// }
// function guess() public{

// }
}