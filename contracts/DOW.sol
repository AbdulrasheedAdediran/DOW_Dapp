// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;
// // Player vs computer
// // Done => Player picks 4 unique random numbers 0 - 9 
// // Done => Validate uniqueness of player's numbers: return "Numbers must be unique" if numbers are not unique
// // Done => Computer picks 4 unique random numbers 0 - 9 (automatically generated)
// // Done => Numbers selected by comp will be stored in an array in the storage
// // Numbers selected by player will be stored in an array in the memory
// // Done => When player guesses unique sequence of numbers, check index of opponent's selected numbers for matches
// // Done => If number(s) from sequence of guessed numbers match(es) opponent's selected numbers by index, return 'dead' indicator
// // Done => Else if sequence of guessed numbers is present in opponent's selected numbers but does not match index, return 'wounded' indicator
// // Done => Each player should only be allowed a maximum of 8 guesses per game
// // Done => Warning message when player has 3 guesses left
// // Done => Warning message when player has 1 guess left

// import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
// contract DOW is ERC20{

//   // --------------------------------Variables--------------------------------
//   uint omega;
//   address owner;
//   mapping(address=> Player) PlayerStruct;
//   // --------------------------------Events --------------------------------
//   event WonOrLost (string message);
//   event Warnings (string message);
//   event PlayerGuesses (uint tries, uint dead, uint wounded, string message);

//   // --------------------------------Errors--------------------------------
//   error Enter4Numbers();
//   error NumbersMustBeUnique();
//   error YouLost();
//   error NotOwner();
//   error InsufficientTokens();

//   // --------------------------------Structs--------------------------------
//   struct Player{
//     uint8 tries;
//     uint[] computerNumber;
//     mapping(uint=> uint[]) trials;
//     mapping (uint => uint) computerIndexToNumber;
//   }

//     // --------------------------------Constructor--------------------------------
//     constructor() ERC20("Dead or Wounded", "DOW"){
//         owner = msg.sender;
//        _mint(address(this), 1000000000000000000000000);
//     }

//     // --------------------------------Functions--------------------------------
//   function randomNumber () internal returns(uint){
//       uint mod = 10;
//       omega += 1 ;
//       return uint(keccak256(abi.encodePacked(block.timestamp, omega, msg.sender))) % mod;
//   }
//   function transferToCreator(uint _amount) external{
//     if(msg.sender != owner) revert NotOwner();
//     _transfer(address(this), owner, _amount);
//   }

//   function clearArray() internal {
//     Player storage P = PlayerStruct[msg.sender];
//       while(P.computerNumber.length > 0){
//         P.computerNumber.pop();
//       }
//   }

//   function startGame() public {
//     Player storage P = PlayerStruct[msg.sender];
//       clearArray();
//       _mint(msg.sender, 100000000000000000000);
//       while (P.computerNumber.length < 4){
//         uint _rand = randomNumber();
//         bool matches = false;
//         for(uint i = 0; i < P.computerNumber.length; i++){
//           if(P.computerNumber[i] == _rand){
//             matches = true;
//             break;
//           }
//         }
//         if (!matches){
//           P.computerNumber.push(_rand);
//           P.computerIndexToNumber[P.computerNumber.length-1] = _rand;
//         }
//       }
//   }
//   function confirmRandomness (uint[] memory numArr) pure internal returns (bool){
//       for(uint i = 0; i <  numArr.length; i++){
//         uint currentInput = numArr[i];
//         for(uint j = 0; j < numArr.length; j++){
//           if(i != j && currentInput == numArr[j]){
//             return false;
//           }
//         }
//       }
//       return true;
//   }
//   modifier  checkPlayerNumbers (uint[] memory numArr){
//     require( numArr.length == 4, "Enter 4 numbers");
//     require (confirmRandomness(numArr) == true, "Numbers must be unique");
//     _;
//   }

//    function playGame (uint[] memory numArr)  external checkPlayerNumbers(numArr) returns (uint wounded, uint dead, string memory message) {
//      (wounded, dead) = confirmGuess (numArr);
//       Player storage P = PlayerStruct[msg.sender];
//      if(balanceOf(msg.sender) < 1000000000000000000000 && dead == 4) startGame();
//      if(balanceOf(msg.sender) < 1000000000000000000000 && dead < 4) {
//       message = winLose(dead);
//       P.tries = 0;
//       emit PlayerGuesses(P.tries, dead, wounded);
//      }
//      _burn (msg.sender, 1000000000000000000000);
//       P.tries++;
//       P.trials[P.tries] = numArr;
//       if (P.tries >8 || dead == 4) startGame();
//       require (P.tries <= 8, "You Lost already");
//       message = winLose(dead);
//       P.tries = 0;
//       emit PlayerGuesses(P.tries, dead, wounded);
//   }

//   function winLose(uint dead) internal returns(string memory message){
//      Player storage P = PlayerStruct[msg.sender];
//     if(P.tries <= 4 && dead == 4) {
//       message = "All Dead!";
//       emit  WonOrLost (message);
//     }
//     if((P.tries > 4 && P.tries <8) && dead == 4) {
//       message = "All Dead!";
//       emit  WonOrLost (message);
//       }
//     if(P.tries ==6 && dead !=4) {
//       message = "2 trials left";
//       emit Warnings (message);
//     }
//     if(P.tries ==7 && dead !=4) {
//       message = "Final trial";
//        emit Warnings (message);
//     }
//     if(P.tries ==8 && dead !=4){
//        message = "You Lost";
//     }
//   }

//   function confirmGuess (uint[] memory numArr) view internal  returns (uint wounded, uint dead){
//     // check if each number exists in computer sequence => status = wounded
//     // if index of guess number == index of computer sequence = dead
//     // comparing computer number to player number
//     Player storage P = PlayerStruct[msg.sender];
//     for(uint i = 0; i <  numArr.length; i++){
//         uint currentInput = numArr[i];
//         for(uint j = 0; j < P.computerNumber.length; j++){
//           if(i == j && currentInput == P.computerNumber[j]){
//              dead++;
//           } else if( i != j && currentInput == P.computerNumber[j]) {
//             wounded++;
//           }
//         }
//       }
//   }
// }
