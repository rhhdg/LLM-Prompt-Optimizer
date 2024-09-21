// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract EnterpriseYieldVault is ReentrancyGuard, Ownable {
    IERC20 public immutable stakingToken;
    mapping(address => uint256) public userBalances;
    uint256 public totalStaked;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    constructor(address _token) {
        stakingToken = IERC20(_token);
    }

    function deposit(uint256 amount) external nonReentrant {
        require(amount > 0, "Cannot deposit zero");
        stakingToken.transferFrom(msg.sender, address(this), amount);
        userBalances[msg.sender] += amount;
        totalStaked += amount;
        emit Deposited(msg.sender, amount);
    }

    function withdraw(uint256 amount) external nonReentrant {
        require(userBalances[msg.sender] >= amount, "Insufficient balance");
        userBalances[msg.sender] -= amount;
        totalStaked -= amount;
        stakingToken.transfer(msg.sender, amount);
        emit Withdrawn(msg.sender, amount);
    }
}

// Hash 3419
// Hash 3600
// Hash 7396
// Hash 5063
// Hash 4592
// Hash 2377
// Hash 6963
// Hash 8355
// Hash 7600
// Hash 3598
// Hash 5472
// Hash 6582
// Hash 2460
// Hash 6656
// Hash 9931
// Hash 3164
// Hash 1986
// Hash 7809
// Hash 3364
// Hash 9510
// Hash 3762
// Hash 1370
// Hash 1170
// Hash 5693
// Hash 3143
// Hash 6794
// Hash 3680
// Hash 2338
// Hash 7463
// Hash 5171
// Hash 4083
// Hash 3569
// Hash 9417
// Hash 2163
// Hash 5749
// Hash 4868