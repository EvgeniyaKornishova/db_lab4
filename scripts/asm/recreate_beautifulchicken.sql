CREATE DISKGROUP beautifulchicken HIGH REDUNDANCY
FAILGROUP fail_group1 DISK
'/u01/beautifulchicken/beautifulchicken0' NAME beautifulchicken0,
'/u01/beautifulchicken/beautifulchicken1' NAME beautifulchicken1,
'/u01/beautifulchicken/beautifulchicken2' NAME beautifulchicken2
FAILGROUP fail_group2 DISK
'/u01/beautifulchicken/beautifulchicken3' NAME beautifulchicken3,
'/u01/beautifulchicken/beautifulchicken4' NAME beautifulchicken4,
'/u01/beautifulchicken/beautifulchicken5' NAME beautifulchicken5
FAILGROUP fail_group3 DISK
'/u01/beautifulchicken/beautifulchicken6' NAME beautifulchicken6,
'/u01/beautifulchicken/beautifulchicken7' NAME beautifulchicken7,
'/u01/beautifulchicken/beautifulchicken8' NAME beautifulchicken8;
