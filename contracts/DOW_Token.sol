// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";

 contract DOW_Token is IERC20{
     string name;
     string symbol;
     uint decimal;
     uint totalSupply_;
     mapping(address => uint) balance;
     mapping(address => mapping(address => uint)) allowance_;
     constructor (string memory _name, string memory _symbol, uint _decimal, uint _totalSupply) {
         name = _name;
         symbol = _symbol;
         decimal = _decimal;
         totalSupply_ = _totalSupply * 10 ** _decimal;
         balance[msg.sender] = totalSupply_;
         emit Transfer(address(0), msg.sender, totalSupply_);
     }

     function totalSupply() external view returns (uint256) {
         return totalSupply_;
     }

     function balanceOf(address account) external view returns (uint256){
         return balance[account];
     }

    function _transfer(address from, address to, uint _amount) internal{
        require(balance[from] >= _amount, "Insufficient balance");
        balance[from] -= _amount;
         balance[to] += _amount;
         emit Transfer(from, to, _amount);
    }
     function transfer(address to, uint256 _amount) external returns (bool){
         _transfer(msg.sender, to, _amount);
         return true;

     }

     function allowance(address owner, address spender) external view returns (uint256){
        return  allowance_[owner][spender];
     }

     function approve(address spender, uint256 amount) external returns (bool){
         require(amount <= balance[msg.sender], "Insufficient balance");
         balance[msg.sender] -= amount;
         allowance_[msg.sender][spender] = amount;
          emit Approval(msg.sender, spender, amount);
         return true;
     }
      function transferFrom (address from, address to, uint256 _amount) external returns (bool) {
          require (allowance_[from][to] >= _amount, "Insufficient allowance");
          allowance_[from][to]-= _amount;
           _transfer(from, to, _amount);
           return true;
      }
 }