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
contract NON_VRF_DOW is ERC20{

  // --------------------------------Variables--------------------------------
  uint omega;
  uint public randNum;
  address owner;
  bool setVRF;
  uint[] public compNum;
  address[] players;
//   address constant VRFaddr = 0x26338299bef45aaa55b9daecab0d0abcb91324fd;
  mapping(address=> Player) public PlayerStruct;
  mapping(address => bool) playerAdded;
  mapping(address =>bool) claimTokens;
  mapping(address => mapping(uint=> bool)) playerPlaying;
  // --------------------------------Events --------------------------------
  event PlayerNumbers (uint256[] compNum);
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
    uint256 gamesPlayed;
    uint64 gamesLost;
    uint64 currentWinStreak;
    uint64 maxWinStreak;
    uint64 gamesWon;
  }

  struct PlayerScore {
    address playerAddress;
    uint96 wins;
  }
    
    // --------------------------------Constructor--------------------------------
    constructor() ERC20("Dead or Wounded", "DOW"){
        owner = msg.sender;
    }

    // --------------------------------Functions--------------------------------

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

  function startGame() external returns (uint256[] memory playerNumbers){
    if(!playerAdded[msg.sender]) {
      playerAdded[msg.sender] = true;
      players.push(msg.sender);
    }
    Player storage o = PlayerStruct[msg.sender];
    if(balanceOf(msg.sender) < 5000000000000000000) revert InsufficientTokens();
    _burn(msg.sender, 5000000000000000000);
    playerNumbers = new uint256[](4);
      while (compNum.length < 4){
         nonVRFNumbers();
      }
    playerNumbers[0] = uint256(compNum[0]);
    playerNumbers[1] = uint256(compNum[1]);
    playerNumbers[2] = uint256(compNum[2]);
    playerNumbers[3] = uint256(compNum[3]); 
    clearArray();
    playerPlaying[msg.sender][o.gamesPlayed] = true;
    emit PlayerNumbers(playerNumbers);
  }


  function checkTrials (uint8 trial) external {
    Player storage o = PlayerStruct[msg.sender];
    if(playerPlaying[msg.sender][o.gamesPlayed] == false) revert PlayerHasNotPlayed();
     o.gamesPlayed++;
    if (trial == 1) {
      o.currentWinStreak++;
      o.gamesWon++;
      _mint(msg.sender, 20000000000000000000);
    } else if (trial == 2) {
      o.currentWinStreak++;
      o.gamesWon++;
      _mint(msg.sender, 20000000000000000000);
    } else if (trial == 3) {
      o.currentWinStreak++;
      o.gamesWon++;
      _mint(msg.sender, 20000000000000000000);
    } else if (trial == 4) {
      o.currentWinStreak++;
      o.gamesWon++;
      _mint(msg.sender, 12000000000000000000);
    } else if (trial == 5) {
      o.currentWinStreak++;
      o.gamesWon++;
      _mint(msg.sender, 12000000000000000000);
    } else if (trial == 6) {
      o.currentWinStreak++;
      o.gamesWon++;
      _mint(msg.sender, 7000000000000000000);
    } else if (trial == 7) {
      o.currentWinStreak++;
      o.gamesWon++;
      _mint(msg.sender, 7000000000000000000);
    }else if (trial == 8) {
      o.currentWinStreak = 0;
      o.gamesLost++;
      _mint(msg.sender, 7000000000000000000);
    }
    if(o.currentWinStreak >= o.maxWinStreak){
      o.maxWinStreak = o.currentWinStreak;
    }
  }

  function checkStreak () external view returns (Player memory) {
    Player storage o = PlayerStruct[msg.sender];
    return o;
  }

  function LeaderBoard () external view returns (PlayerScore[] memory leaderBoard) {
    leaderBoard = new PlayerScore[](players.length);
    for (uint i = 0; i < players.length; i++) {
      Player storage o = PlayerStruct[players[i]];
      leaderBoard[i].playerAddress = players[i];
      leaderBoard[i].wins = o.gamesWon;
    }
  }

  function claimFreeTokens() external {
    if(claimTokens[msg.sender]) revert AlreadyClaimedFreeTokens();
     claimTokens[msg.sender] = true;
    _mint(msg.sender, 100000000000000000000);
  }

  function transferToCreator(uint _amount) external{
    if(msg.sender != owner) revert NotOwner();
    _mint(owner, _amount);
  }

}
