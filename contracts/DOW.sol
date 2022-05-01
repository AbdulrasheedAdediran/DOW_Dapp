// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;
// Player vs computer
// Done => Player picks 4 unique random numbers 0 - 9 
// Done => Validate uniqueness of player's numbers: return "Numbers must be unique" if numbers are not unique
// Done => Computer picks 4 unique random numbers 0 - 9 (automatically generated)
// Done => Numbers selected by comp will be stored in an array in the storage
// Numbers selected by player will be stored in an array in the memory
// Done => When player guesses unique sequence of numbers, check index of opponent's selected numbers for matches
// Done => If number(s) from sequence of guessed numbers match(es) opponent's selected numbers by index, return 'dead' indicator
// Done => Else if sequence of guessed numbers is present in opponent's selected numbers but does not match index, return 'wounded' indicator
// Done => Each player should only be allowed a maximum of 8 guesses per game
// Done => Warning message when player has 3 guesses left
// Done => Warning message when player has 1 guess left

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {VRFv2Consumer} from "./VRFv2Consumer.sol";
contract DOW is ERC20{

  // --------------------------------Variables--------------------------------
  uint omega;
  uint public randNum;
  address owner;
  bool setVRF;
  VRFv2Consumer vrf;
  uint[] public compNum;
//   address constant VRFaddr = 0x26338299bef45aaa55b9daecab0d0abcb91324fd;
  mapping(address=> Player) public PlayerStruct;
  mapping(uint => mapping(uint=> bool)) chosenNum;
  mapping(address =>bool) claimTokens;
  mapping(address => mapping(uint=> bool)) playerPlaying;
  // --------------------------------Events --------------------------------
  event PlayerNumbers (bytes32[] compNum);
  event compNumber (uint256[] compNumber);

  // --------------------------------Errors--------------------------------
  error Enter4Numbers();
  error NumbersMustBeUnique();
  error YouLost();
  error NotOwner();
  error InsufficientTokens();
  error AlreadyClaimedFreeTokens();
  error PlayerHasNotPlayed();

  // --------------------------------Structs--------------------------------
  struct Player{
    uint32 firstTrial;
    uint32 secondTrial;
    uint32 thirdTrial;
    uint32 fourthtrial;
    uint32 fifthTrial;
    uint32 sixthTrial;
    uint32 seventhTrial;
    uint8 currentTrialNumber;
    uint16 currentStreak;
  }

    // --------------------------------Constructor--------------------------------
    constructor(address VRFaddress) ERC20("Dead or Wounded", "DOW"){
        owner = msg.sender;
       vrf = VRFv2Consumer(VRFaddress);
    }

    // --------------------------------Functions--------------------------------

    // --------------------------------VRF Method--------------------------------
  function generateRandomNumber () internal {
          vrf.requestRandomWords();
           randNum = vrf.s_requestId();
    }
   
   function saveRandTemp () public {
     randNum = 51950834380448387426091044641482712752411538615582012744600401607787590818280;
   }
  // VRF Address = 0xd9145CCE52D386f254917e481eB44e9943F39138
  // 51950834380448387426091044641482712752411538615582012744600401607787590818280

  function vrfNumbers() internal {
    generateRandomNumber();
    uint _rand = randNum >> randomNumber();
              bool matches = false;
        for(uint i = 0; i < compNum.length; i++){
          if(compNum[i] == _rand % 10){
            matches = true;
            break;
          }   
        }
        if (!matches){
          compNum.push(_rand % 10);
        }
  }
    // --------------------------------NON VRF Method--------------------------------

   function randomNumber () internal returns(uint){
      uint mod = 10;
      omega += 1 ;
      return uint(keccak256(abi.encodePacked(block.timestamp, omega, msg.sender))) % mod;
   } 
   function nonVRFNumbers () internal {
    uint _rand = randomNumber();
        bool matches = false;
        for(uint i = 0; i < compNum.length; i++){
          if(compNum[i] == _rand){
            matches = true;
            break;
          }
        }
        if (!matches){
          compNum.push(_rand);
        }
  }
   // --------------------------------End of Non VRF Method--------------------------------

  function clearArray() internal {
      while(compNum.length > 0){
        compNum.pop();
      }
  }

  function setToUseVRF () external {
      setVRF = true;
  }

   function setTNotoUseVRF () external {
      setVRF = false;
  }

  function startGame() external returns (bytes32[] memory playerNumbers){
    Player storage o = PlayerStruct[msg.sender];
    if(balanceOf(msg.sender) < 5000000000000000000) revert InsufficientTokens();
    _transfer(msg.sender, address(this), 5000000000000000000);
    playerNumbers = new bytes32[](4);
      while (compNum.length < 4){
        if (setVRF) {
          vrfNumbers();
        }
        else nonVRFNumbers();
      }
    playerNumbers[0] = keccak256(abi.encodePacked("D",uint256(compNum[0]),"W"));
    playerNumbers[1] = keccak256(abi.encodePacked("D",uint256(compNum[1]),"W"));
    playerNumbers[2] = keccak256(abi.encodePacked("D",uint256(compNum[2]),"W"));
    playerNumbers[3] = keccak256(abi.encodePacked("D",uint256(compNum[3]),"W")); 
    clearArray();
    playerPlaying[msg.sender][o.currentStreak] = true;
    emit PlayerNumbers(playerNumbers);
  }

  function checkTrials (uint8 trial) external {
    Player storage o = PlayerStruct[msg.sender];
    if(playerPlaying[msg.sender][o.currentStreak] == false) revert PlayerHasNotPlayed();
    if (trial == 1) {
      o.firstTrial++;
      _mint(msg.sender, 20000000000000000000);
    } else if (trial == 2) {
      o.secondTrial++;
      _mint(msg.sender, 20000000000000000000);
    } else if (trial == 3) {
      o.thirdTrial++;
      _mint(msg.sender, 20000000000000000000);
    } else if (trial == 4) {
      o.fourthtrial++;
      _mint(msg.sender, 12000000000000000000);
    } else if (trial == 5) {
      o.fifthTrial++;
      _mint(msg.sender, 12000000000000000000);
    } else if (trial == 6) {
      o.sixthTrial++;
      _mint(msg.sender, 7000000000000000000);
    } else if (trial == 7) {
      o.seventhTrial++;
      _mint(msg.sender, 7000000000000000000);
    }
    o.currentTrialNumber = trial;
    o.currentStreak++;
  }

  function checkStreak () external view returns (Player memory) {
    Player storage o = PlayerStruct[msg.sender];
    return o;
  }

    function claimFreeTokens() external {
    if(claimTokens[msg.sender]) revert AlreadyClaimedFreeTokens();
     claimTokens[msg.sender] = true;
    _mint(msg.sender, 10000000000000000000);
  }

  function transferToCreator(uint _amount) external{
    if(msg.sender != owner) revert NotOwner();
    _mint(owner, _amount);
  }

  // function confirmRandomness (uint[] memory numArr) pure internal returns (bool){
  //     for(uint i = 0; i <  numArr.length; i++){
  //       uint currentInput = numArr[i];
  //       for(uint j = 0; j < numArr.length; j++){
  //         if(i != j && currentInput == numArr[j]){
  //           return false;
  //         }
  //       }
  //     }
  //     return true;
  // }

  // modifier  checkPlayerNumbers (uint[] memory numArr){
  //   require( numArr.length == 4, "Enter 4 numbers");
  //   require (confirmRandomness(numArr) == true, "Numbers must be unique");
  //   _;
  // }

  //  function playGame (uint[] memory numArr)  external checkPlayerNumbers(numArr) returns (uint wounded, uint dead) {
  //    (wounded, dead) = confirmGuess (numArr);
  //     Player storage P = PlayerStruct[msg.sender];
  //    if(balanceOf(msg.sender) < 1000000000000000000000 && dead == 4) startGame();
  //    if(balanceOf(msg.sender) < 1000000000000000000000 && dead < 4) {
  //     message = winLose(dead);
  //     emit PlayerGuesses(P.tries, dead, wounded);
  //    }
  //    _burn (msg.sender, 1000000000000000000000);
  //     P.tries++;
  //     P.trials[P.tries] = numArr;
  //     if (P.tries >8 || dead == 4) startGame();
  //     require (P.tries <= 8, "You Lost already");
  //     message = winLose(dead);
  //     P.tries = 0;
  //     emit PlayerGuesses(P.tries, dead, wounded);
  // }

  // function winLose(uint dead) internal returns(string memory message){
  //    Player storage P = PlayerStruct[msg.sender];
  //   if(P.tries <= 4 && dead == 4) {
  //     message = "All Dead!";
  //     emit  WonOrLost (message);
  //   }
  //   if((P.tries > 4 && P.tries <8) && dead == 4) {
  //     message = "All Dead!";
  //     emit  WonOrLost (message);
  //     }
  //   if(P.tries ==6 && dead !=4) {
  //     message = "2 trials left";
  //     emit Warnings (message);
  //   }
  //   if(P.tries ==7 && dead !=4) {
  //     message = "Final trial";
  //      emit Warnings (message);
  //   }
  //   if(P.tries ==8 && dead !=4){
  //      message = "You Lost";
  //   }
  // }

  // function confirmGuess (uint[] memory numArr) view external  returns (uint wounded, uint dead){
  //   // check if each number exists in computer sequence => status = wounded
  //   // if index of guess number == index of computer sequence = dead
  //   // comparing computer number to player number
  //   Player storage P = PlayerStruct[msg.sender];
  //   for(uint i = 0; i <  numArr.length; i++){
  //       uint currentInput = numArr[i];
  //       for(uint j = 0; j < computerNumber.length; j++){
  //         if(i == j && currentInput == P.computerNumber[j]){
  //            dead++;
  //         } else if( i != j && currentInput == P.computerNumber[j]) {
  //           wounded++;
  //         }
  //       }
  //     }
  // }
}
