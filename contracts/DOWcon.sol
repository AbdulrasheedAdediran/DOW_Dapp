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

contract DOW is ERC20 {
    // --------------------------------Variables--------------------------------
    uint256 omega;
    uint256 public randNum;
    address owner;
    bool setVRF;
    VRFv2Consumer vrf;
    uint256[] public compNum;
    address[] players;
    //   address constant VRFaddr = 0x26338299bef45aaa55b9daecab0d0abcb91324fd;
    mapping(address => Player) public PlayerStruct;
    mapping(address => bool) playerAdded;
    mapping(address => bool) claimTokens;
    mapping(address => mapping(uint256 => bool)) playerPlaying;
    // --------------------------------Events --------------------------------
    event PlayerNumbers(bytes32[] compNum);
    event compNumber(uint256[] compNumber);

    // --------------------------------Errors--------------------------------
    error Enter4Numbers();
    error NumbersMustBeUnique();
    error YouLost();
    error NotOwner();
    error InsufficientTokens();
    error AlreadyClaimedFreeTokens();
    error PlayerHasNotPlayed();

    // --------------------------------Structs--------------------------------
    struct Player {
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
    constructor(address VRFaddress) ERC20("Dead or Wounded", "DOW") {
        owner = msg.sender;
        vrf = VRFv2Consumer(VRFaddress);
    }

    // --------------------------------Modifiers--------------------------------

    modifier onlyOwner() {
        if (msg.sender != owner) revert NotOwner();
        _;
    }

    // --------------------------------Functions--------------------------------

    /**
     * return the msg.data of this call.
     * if the call came through our trusted forwarder, then the real sender was appended as the last 20 bytes
     * of the msg.data - so this method will strip those 20 bytes off.
     * otherwise (if the call was made directly and not through the forwarder), return `msg.data`
     * should be used in the contract instead of msg.data, where this difference matters.
     */
    // --------------------------------VRF Method--------------------------------
    function generateRandomNumber() public {
        vrf.requestRandomWords();
        randNum = vrf.s_requestId();
    }

    // VRF Address = 0x73fDB6c756fEF146972eeB277373b1638cc6d215

    function vrfNumbers() internal {
        uint256 _rand = randNum >> randomNumber();
        bool matches = false;
        for (uint256 i = 0; i < compNum.length; i++) {
            if (compNum[i] == _rand % 10) {
                matches = true;
                break;
            }
        }
        if (!matches) {
            compNum.push(_rand % 10);
        }
    }

    function randomNumber() internal returns (uint256) {
        uint256 mod = 10;
        omega += 1;
        return
            uint256(
                keccak256(abi.encodePacked(block.timestamp, omega, msg.sender))
            ) % mod;
    }

    function clearArray() internal {
        while (compNum.length > 0) {
            compNum.pop();
        }
    }

    function setToUseVRF() external {
        setVRF = true;
    }

    function setToNotUseVRF() external {
        setVRF = false;
    }

    function startGame() external returns (bytes32[] memory playerNumbers) {
        if (!playerAdded[msg.sender]) {
            playerAdded[msg.sender] = true;
            players.push(msg.sender);
        }
        Player storage o = PlayerStruct[msg.sender];
        if (balanceOf(msg.sender) < 5000000000000000000)
            revert InsufficientTokens();
        _transfer(msg.sender, address(this), 5000000000000000000);
        playerNumbers = new bytes32[](4);
        while (compNum.length < 4) {
            vrfNumbers();
        }
        playerNumbers[0] = keccak256(abi.encodePacked(uint256(compNum[0])));
        playerNumbers[1] = keccak256(abi.encodePacked(uint256(compNum[1])));
        playerNumbers[2] = keccak256(abi.encodePacked(uint256(compNum[2])));
        playerNumbers[3] = keccak256(abi.encodePacked(uint256(compNum[3])));
        clearArray();
        playerPlaying[msg.sender][o.gamesPlayed] = true;
        emit PlayerNumbers(playerNumbers);
    }

    function checkTrials(uint8 trial) external {
        Player storage o = PlayerStruct[msg.sender];
        if (playerPlaying[msg.sender][o.gamesPlayed] == false)
            revert PlayerHasNotPlayed();
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
        } else if (trial == 8) {
            o.currentWinStreak = 0;
            o.gamesLost++;
            _mint(msg.sender, 7000000000000000000);
        }
        if (o.currentWinStreak >= o.maxWinStreak) {
            o.maxWinStreak = o.currentWinStreak;
        }
    }

    function checkStreak() external view returns (Player memory) {
        Player storage o = PlayerStruct[msg.sender];
        return o;
    }

    function LeaderBoard()
        external
        view
        returns (PlayerScore[] memory leaderBoard)
    {
        leaderBoard = new PlayerScore[](players.length);
        for (uint256 i = 0; i < players.length; i++) {
            Player storage o = PlayerStruct[players[i]];
            leaderBoard[i].playerAddress = players[i];
            leaderBoard[i].wins = o.gamesWon;
        }
    }

    function claimFreeTokens() external {
        if (claimTokens[msg.sender]) revert AlreadyClaimedFreeTokens();
        claimTokens[msg.sender] = true;
        _mint(msg.sender, 100000000000000000000);
    }

    function transferToCreator(uint256 _amount) external onlyOwner {
        _mint(owner, _amount);
    }
}
