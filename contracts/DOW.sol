// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;
// Player vs computer
// Done => Player picks 4 unique random numbers 0 - 9 
// Done => Validate uniqueness of player's numbers: return "Numbers must be unique" if numbers are not unique
// Done => Computer picks 4 unique random numbers 0 - 9 (automatically generated)
// Done => Numbers selected by comp will be stored in an array in the storage
// Numbers selected by player will be stored in an array in the memory
// When player guesses unique sequence of numbers, check index of opponent's selected numbers for matches
// If number(s) from sequence of guessed numbers match(es) opponent's selected numbers by index, return 'dead' indicator
// Else if sequence of guessed numbers is present in opponent's selected numbers but does not match index, return 'wounded' indicator
// Each player should only be allowed a maximum of 7 guesses per game
// Warning message when player has 3 guesses left
// Warning message when player has 1 guess left
contract DOW {

  uint tries;
  uint omega;
  uint[] computerNumber;
  uint[] playerNumber;
  mapping(uint=> uint[]) trials;
  mapping (uint => uint) computerIndexToNumber;



  function randomNumber () internal returns(uint){
      uint mod = 10;
      omega += 1 ;
      return uint(keccak256(abi.encodePacked(block.timestamp, omega, msg.sender))) % mod;
  }

  function clearArray() internal {
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
          computerIndexToNumber[computerNumber.length-1] = _rand;
        }
      }
      return computerNumber;  
  }
  function confirmRandomness (uint[] memory numArr) pure internal returns (bool){
      for(uint i = 0; i <  numArr.length; i++){
        uint currentInput = numArr[i];
        for(uint j = 0; j < numArr.length; j++){
          if(i != j && currentInput == numArr[j]){
            return false;
          }
        }
      }
      return true;
  }
  modifier  checkPlayerNumbers (uint[] memory numArr){
    require( numArr.length == 4, "Enter 4 numbers");
    require (confirmRandomness(numArr) == true, "Numbers must be unique");
    _;
  }

   function playGame (uint[] memory numArr)  external returns (uint wounded, uint dead, string memory message) {
      tries++;
      (wounded, dead) = confirmGuess (numArr);
      trials[tries] = numArr;
      if (tries >8 || dead == 4) startGame();
      require (tries <= 8, "You Lost already");
      message = winLose(dead);
  }

  function winLose(uint dead) view internal returns(string memory message){
    if(tries <= 4 && dead == 4) message = "Genius! All Dead!";
    if((tries > 4 && tries <8) && dead == 4) message = "Took you so long! All Dead!";
    if(tries ==6 && dead !=4) message = "You have 2 trials left";
    if(tries ==7 && dead !=4) message = "This is your final trial";
    if(tries ==8 && dead !=4) message = "You Lost!!!";
  }

  function confirmGuess (uint[] memory numArr) view internal  returns (uint wounded, uint dead){
    // check if each number exists in computer sequence => status = wounded
    // if index of guess number == index of computer sequence = dead
    // comparing computer number to player number
    for(uint i = 0; i <  numArr.length; i++){
        uint currentInput = numArr[i];
        for(uint j = 0; j < computerNumber.length; j++){
          if(i == j && currentInput == computerNumber[j]){
             dead++;
          } else if( i != j && currentInput == computerNumber[j]) {
            wounded++;
          }
        }
      }
  }
}