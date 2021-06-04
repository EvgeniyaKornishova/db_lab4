CREATE DISKGROUP cuteduck NORMAL REDUNDANCY
FAILGROUP fail_group1 DISK
'/u01/cuteduck/cuteduck0' NAME cuteduck0,
'/u01/cuteduck/cuteduck1' NAME cuteduck1
FAILGROUP fail_group2 DISK
'/u01/cuteduck/cuteduck2' NAME cuteduck2,
'/u01/cuteduck/cuteduck3' NAME cuteduck3
FAILGROUP fail_group3 DISK
'/u01/cuteduck/cuteduck4' NAME cuteduck4,
'/u01/cuteduck/cuteduck5' NAME cuteduck5;
