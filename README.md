# DOW_Dapp

A decentralised number guessing game
npm init -y
npm install -D hardhat
npx hardhat
Create an empty hardhat config
npm install --save-dev @nomiclabs/hardhat-waffle @nomiclabs/hardhat-ethers ethereum-waffle chai ethers solidity-coverage
npx hardhat compile

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

// 3 difficulty levels:
// Easy (Less likelihood of computer guessing right)
// Medium (Moderate likelihood of computer guessing right)
// Hard (High likelihood of computer guessing right)
//
