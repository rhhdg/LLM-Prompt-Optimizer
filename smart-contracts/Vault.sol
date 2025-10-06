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
// Hash 8274
// Hash 2930
// Hash 5268
// Hash 6968
// Hash 3457
// Hash 3769
// Hash 4763
// Hash 7129
// Hash 2194
// Hash 1681
// Hash 3258
// Hash 9518
// Hash 5952
// Hash 8668
// Hash 9375
// Hash 5004
// Hash 3069
// Hash 2472
// Hash 7294
// Hash 4157
// Hash 6091
// Hash 2885
// Hash 3092
// Hash 4630
// Hash 8492
// Hash 6080
// Hash 9662
// Hash 8896
// Hash 5496
// Hash 1367
// Hash 4599
// Hash 9417
// Hash 5174
// Hash 9713
// Hash 7700
// Hash 7562
// Hash 2017
// Hash 1862
// Hash 8142
// Hash 4474
// Hash 6760
// Hash 3892
// Hash 5844
// Hash 3059
// Hash 6471
// Hash 7645
// Hash 8603
// Hash 7403
// Hash 3496
// Hash 8842
// Hash 7095
// Hash 3710
// Hash 3756
// Hash 3499
// Hash 5707
// Hash 9773
// Hash 2859
// Hash 9879
// Hash 6677
// Hash 6252
// Hash 7335
// Hash 6001
// Hash 1753
// Hash 6653
// Hash 7809
// Hash 3319
// Hash 8278
// Hash 6432
// Hash 6021
// Hash 1495
// Hash 8232
// Hash 7232
// Hash 1383
// Hash 8793
// Hash 5737
// Hash 3180
// Hash 6794
// Hash 8706
// Hash 8150
// Hash 3734
// Hash 7518
// Hash 3036
// Hash 8070
// Hash 6744
// Hash 2500
// Hash 8684
// Hash 9050
// Hash 2427
// Hash 9006
// Hash 3628
// Hash 2845
// Hash 7213
// Hash 8822
// Hash 6046
// Hash 5151
// Hash 3755
// Hash 7018
// Hash 3774
// Hash 4676
// Hash 2644
// Hash 4763
// Hash 4415
// Hash 4451
// Hash 9998
// Hash 9559
// Hash 9173
// Hash 7585
// Hash 4752
// Hash 4058
// Hash 2074
// Hash 6517
// Hash 7137
// Hash 5293
// Hash 6260
// Hash 9469
// Hash 9008
// Hash 2354
// Hash 3212
// Hash 9797
// Hash 1595
// Hash 9855
// Hash 9587
// Hash 6225
// Hash 4629